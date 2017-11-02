package org.habitatmclean.table;

import org.habitatmclean.entity.House;
import org.habitatmclean.entity.RetrievableProperties;

import java.util.ArrayList;
import java.util.List;

public class HouseTable extends Table {
    public HouseTable() {
        super(new String[]{"address", "construction cost", "bedrooms", "bathrooms"}, new HouseModal()); // adjust this to determine table columns
    }
    @Override
    public void addRow(RetrievableProperties entity) {
        House house = (House) entity;
        List<TableRow.TableCell> tableCells = new ArrayList<TableRow.TableCell>();
        tableCells.add(new TableRow.TableCell(house.getAddress().getNumber() + " " +
                                            house.getAddress().getStreet() + " " +
                                            house.getAddress().getCity() + " " +
                                            house.getAddress().getState() + " " +
                                            house.getAddress().getZipcode()));
        tableCells.add(new TableRow.TableCell("" + house.getConstruction_cost()));
        tableCells.add(new TableRow.TableCell("" + house.getBedrooms()));
        tableCells.add(new TableRow.TableCell("" + house.getBathrooms()));
        rows.add(new TableRow(tableCells));
    }

    static public class HouseModal extends Modal{
        public HouseModal(){
            super("House");
        }

        public void buildModal(){

        }
    }

}
