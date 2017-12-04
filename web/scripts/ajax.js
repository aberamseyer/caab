(function() {
    var pk;
    $( document ).ready(function() {
        var date = new Date();
        var dateString = ((date.getMonth() + 1) + '/' + date.getDate() + '/' +  date.getFullYear());
        var meridian = date.getHours() > 12 ? 'PM' : 'AM';
        var timeString = (((date.getHours() > 12) ? date.getHours()-12 : date.getHours()) + ":") + date.getMinutes() + ' ' + meridian;
        $('#reportTime').html($('#reportTime').html() + timeString + '<br/>' + dateString);
        loadPropertySearch();
        getData();

    });

    function loadPropertySearch() {
        $.ajax({
            type: 'GET',
            url: '/search-servlet',
            cache: false,
            success: function (response) {
                // add listener to button and enable
                const $searchButton = $('#propertyAddressSearchBtn');
                const $searchBox = $('#propertySearchBox');
                const $properties = $('#properties');
                const $hiddenInput = $('#propertySearchBox-hidden');
                $searchButton.prop('disabled', false);
                $searchButton.on('click', function() {
                    var valid = false;
                    $('datalist option').each(function() {
                       if($(this).val() == $searchBox.val())
                           valid = true;
                    });
                    if($searchBox.val() != '' && valid) {
                        // load properties page with all results
                        if ($('#page-type').val() == 'person')
                            window.location = './pages/properties.html?page=1&perPage=-1&search=' + $hiddenInput.val();
                        else
                            window.location = './properties.html?page=1&perPage=-1&search=' + $hiddenInput.val();
                    }
                    else if(!valid) {
                        iziToast.error({
                            title: 'Address Error',
                            timeout: 1500,
                            message: 'Specify a valid address from the list'
                        });
                    }
                });

                // populate data list
                console.log(response);
                var obj = JSON.parse(response);
                $.each(obj, function(id, addr) {
                    if(id != '')
                        $properties.append('<option data-value="' + id + '">' + addr + '</option>');
                });

                // listener to update correct value from datalist
                $searchBox.on('input', function (e) {
                    var $input = $(e.target),
                        $options = $('#' + $input.attr('list') + ' option'),
                        label = $input.val();

                    $hiddenInput.val(label);

                    for (var i = 0; i < $options.length; i++) {
                        var $option = $options.eq(i);

                        if ($option.text() === label) {
                            $hiddenInput.val($option.attr('data-value'));
                            break;
                        }
                    }
                });

            }
        });
    }

    getData = function() {
        const page = $('#page-type').val();
        const pageNumber = getParameterByName('page');
        const params = '?' + window.location.href.split('?')[1];
        var url;
        switch(page){   // put any table-specific code in here (i.e., the log hidden input fill)
            case "person":
                url = '/person-servlet';
                break;
            case "house":
                url = '/house-servlet';
                break;
            case "property":
                url = '/property-servlet';
                break;
            case "vendor":
                url = '/vendor-servlet';
                break;
            case "zone":
                url = '/zone-servlet';
                break;
            case "log":
                url = '/log-servlet';
                console.log(window.location.href);
                $('#fk').val(getParameterByName('fk'));
                $('#pname').val(getParameterByName('pname'));
                break;
            default:
                url = '/person-servlet';
        }
        url += params;

        clearTable();
        $('#spinner').show();
        $.ajax({
            type: 'GET',
            url: url,
            cache: false,
            data: $.param({page:pageNumber}),
            success: function (response) {
                $('#spinner').hide();

                // remove trailing result size info and use it to build page links
                var index = response.lastIndexOf('resultsSize:');
                var size = response.substring(index+12, response.size); // 12 is length of string 'resultsSize:'
                response = response.substring(0, index);
                console.log('result set size:' + size);

                $('#tableContent').append(response);//.hide().fadeIn(300);
                new Table($('.table'));

                //handle property address search
                if($('#page-type').val() === 'property' && getParameterByName('search') != null) {
                    $('#search').val(getParameterByName('search'));
                    $('.filter').each(function() {
                        if($(this).attr('value') === 'property number') {
                            $(this).trigger("click");
                        }
                    });
                }

                addPagination(size);
            }
        });
    };

    function clearTable() {
        $('#tableContent').empty(); // everything
    }

    /* copied from https://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript */
    getParameterByName = function(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    };

    // fills the page selector with the appropriate values
    addPagination= function(size) {
        var resultsPerPage = 50;
        if(getParameterByName('perPage'))
            resultsPerPage = getParameterByName('perPage');
        var lastPageNumber;
        if(resultsPerPage == -1)
            lastPageNumber = 1;
        else
            lastPageNumber = Math.abs(Math.ceil(size / resultsPerPage));
        var currentPageNumber = 1;
        if(getParameterByName('page')) {
            currentPageNumber = getParameterByName('page');
            // don't allow invalid pages #s
            if (currentPageNumber < 1)
                currentPageNumber = 1;
            if (currentPageNumber > lastPageNumber)
                currentPageNumber = lastPageNumber;
        }

        const currentPage = window.location.href.split('?')[0];

        console.log('last page number', lastPageNumber);

        for (var i = 1; i <= lastPageNumber; i++) {
            if (i == currentPageNumber)
                $('#pageSelector').append('<option selected="selected" value="' + i + '">' + i + '</option>');
            else
                $('#pageSelector').append('<option value="' + i + '">' + i + '</option>')
        }

        // results per page box
        $('#perPageSelector').find('option').each(function() {
            if($(this).text() == resultsPerPage || (resultsPerPage == -1 && $(this).text() == 'All')) {
                $(this).attr('selected', 'selected');
                return false;
            }
        });
    }
})();
