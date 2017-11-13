(function() {

    Table = function($table){
        const $modal = $table.nextAll('#record-modal');
        const $addBtn = $('.btn-add');
        const $reportBtn = $('.btn-report');
        const table = this;
        $.extend(this,{
            $addBtn:$addBtn,
            $reportBtn:$reportBtn,
            page:$('#page-type').val(), // if we ever want more than one table per page, we'll need to remove this from the page and mase it specific to table
            $recordAction: $modal.find('.record-action'),
            $modalBtn: $modal.find('#modal-submit'),
            $modal: $modal,
            $Form: $modal.find('.modal-content'),
            $modalForms: $modal.find('.form-control'),
            $recordId: $modal.find('input[name="item-id"]'),

            add:function(){
                this.$modal.modal('show');
                this.$recordAction.html('Add ');
                this.$recordId.val("");
            },

            edit:function(id){
                this.$modal.modal('show');
                this.$recordAction.html('Edit ');
                this.$recordId.val(id);
            },
            submit:function(){
                var data = {
                    id: this.$recordId.val(),
                    table: this.page
                };

                var name;
                this.$modalForms.each(function(index){
                    name = $(this).attr("name");
                    data[name] = $(this).val();
                });

                table.$modal.modal('hide').one('hidden.bs.modal',function(){
                    $.ajax({
                        type: 'POST',
                        url: '/dbservlet',
                        data:data,
                        success: function () {
                            // console.log( );
                            console.log('returned');
                            getData(); // reload table after deletion
                        }
                    });
                });

            },
            confirmDelete:function(pk){
                // TODO apply styling to selected row to show which will be deleted
                iziToast.show({
                    timeout: 6000,
                    close: false,
                    overlay: true,
                    id: 'deleteDialogue',
                    color: 'red',
                    layout: 2,
                    drag: false,
                    title: 'Deleting Row',
                    icon: 'fa fa-question',
                    message: 'Are you sure? <b>This cannot be undone!</b><br/><input type="checkbox" class="form-check-input" id="deleteCheck"><label for="deleteCheck">&nbsp;&nbsp;&nbsp;I understand</label>',
                    position: 'center',
                    closeOnEscape: true,
                    buttons: [
                        ['<button><b>YES</b></button>', function (instance, toast) {

                            instance.hide(toast, { transitionOut: 'fadeOut' }, 'button');
                            table.deleteRow(pk, $('#deleteCheck').prop("checked"));
                        }, true],
                        ['<button id="no">NO</button>', function (instance, toast) {

                            instance.hide(toast, { transitionOut: 'fadeOut' }, 'button');

                        }]
                    ],
                    onClosing: function(instance, toast, closedBy){
                        console.info('Closing | closedBy: ' + closedBy);
                    },
                    onClosed: function(instance, toast, closedBy){
                        console.info('Closed | closedBy: ' + closedBy);
                    }
                });
            },
            deleteRow:function(pk, checked) {
                var toastMessage = 'Operation aborted by not giving consent.';
                if(checked) {
                    toastMessage = 'Row successfully deleted';
                    $.ajax({
                        type: 'POST',
                        url: '/delete',
                        data: $.param({data_type: 'Person', primary_k: pk}),    // TODO globablize data type better?
                        success: function () {
                            console.log(' ' + pk);
                            getData(); // reload table after deletion
                        }
                    });
                }
                iziToast.show({
                    title: 'Row Deletion',
                    message: toastMessage,
                    timeout: 3500,
                    color: 'blue',
                    icon: 'fa fa-info-circle',
                    layout: 2,
                    position: 'bottomRight',
                    progressBar: false
                });
            },
            downloadReport:function() {
                window.location='/pdfgen?page=' + $('#page-type').val();
                $reportBtn.toggleClass('disabled');
                $reportBtn.html('Generating...');
                setTimeout(function() {
                    $reportBtn.toggleClass('disabled');
                    $reportBtn.html('Generate Report From Table');
                }, 1500); // prevent spamming report generation button
            },
            init:function(){
                this.initButtons();
                //any other things to init
                this.$Form.submit(function(e){
                    table.submit();
                    return false;
                });
            },
            initButtons: function (){
                this.$addBtn.on('click',function(){
                    table.add();
                });
                this.$reportBtn.on('click', function() {
                    table.downloadReport();
                });
                $table.find('.btn-edit').on('click',function(){
                    table.edit(getId(this));
                });

                $table.find('.btn-delete').on('click', function() {
                    table.confirmDelete(getId(this));
                });
            }
        });
        this.init();
    };

    function getId(button){
        return $(button).parent().parent().attr('id').substring(7);
    };
})();