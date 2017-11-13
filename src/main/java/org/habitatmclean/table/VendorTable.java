package org.habitatmclean.table;

import org.habitatmclean.entity.GenericEntity;
import org.habitatmclean.entity.Organization;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class VendorTable extends Table {
    public VendorTable() {
        super(new String[]{"name", "contact"}, new VendorModal(), false); // adjust this to determine table columns
    }
    @Override
    public void addRow(GenericEntity entity) {
        Organization organization = (Organization) entity;
        List<TableRow.TableCell> tableCells = new ArrayList<TableRow.TableCell>();
        tableCells.add(new TableRow.TableCell(organization.getName()));
        tableCells.add(new TableRow.TableCell(organization.getContact().getFirst()));
        TableRow tr = new TableRow(tableCells);
        tr.setRowId( "" + entity.getId());
        rows.add(tr);
    }

    public void write(HttpServletRequest request){
        List<String> fields = this.returnModalFields();
        for(String field : fields){
            if(request.getParameter(field) != null)
                System.out.println(field + ": " + request.getParameter(field));
        }
    }

    static public class VendorModal extends Modal{
        public VendorModal(){
            super("Vendor");
        }

        public void buildModal(){

        }
    }
}
