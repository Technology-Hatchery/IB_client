package com.tws.samples.Java.apidemo.panels.resources;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class LegModel extends AbstractTableModel {
    ArrayList<LegRow> m_legRows;

    public LegModel(ArrayList<LegRow> legRows) {
        m_legRows = legRows;
    }

    @Override
    public int getRowCount() {
        return m_legRows.size();
    }

    @Override
    public int getColumnCount() {
        return 3;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Action";
            case 1:
                return "Ratio";
            case 2:
                return "Description";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        LegRow row = m_legRows.get(rowIn);
        switch (col) {
            case 0:
                return row.m_leg.action();
            case 1:
                return row.m_leg.ratio();
            case 2:
                return row.m_contract.description();
            default:
                return null;
        }
    }
}
