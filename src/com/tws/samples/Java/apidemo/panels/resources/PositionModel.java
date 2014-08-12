package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.Formats;
import com.ib.controller.NewContract;
import com.ib.interfaces.IPositionHandler;
import com.tws.samples.Java.apidemo.panels.PositionsPanel;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Alfred on 8/11/2014.
 */
public class PositionModel extends AbstractTableModel implements IPositionHandler {
    HashMap<PositionKey, PositionRow> m_map = new HashMap<PositionKey, PositionRow>();
    ArrayList<PositionRow> m_list = new ArrayList<PositionRow>();

    @Override
    public void position(String account, NewContract contract, int position, double avgCost) {
        PositionKey key = new PositionKey(account, contract.conid());
        PositionRow row = m_map.get(key);
        if (row == null) {
            row = new PositionRow();
            m_map.put(key, row);
            m_list.add(row);
        }
        row.update(account, contract, position, avgCost);

        if (PositionsPanel.m_complete) {
            PositionsPanel.m_model.fireTableDataChanged();
        }
    }

    @Override
    public void positionEnd() {
        PositionsPanel.m_model.fireTableDataChanged();
        PositionsPanel.m_complete = true;
    }

    public void clear() {
        m_map.clear();
        m_list.clear();
        fireTableDataChanged();
    }

    @Override
    public int getRowCount() {
        return m_map.size();
    }

    @Override
    public int getColumnCount() {
        return 4;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Account";
            case 1:
                return "Contract";
            case 2:
                return "Position";
            case 3:
                return "Avg Cost";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        PositionRow row = m_list.get(rowIn);

        switch (col) {
            case 0:
                return row.m_account;
            case 1:
                return row.m_contract.description();
            case 2:
                return row.m_position;
            case 3:
                return Formats.fmt(row.m_avgCost);
            default:
                return null;
        }
    }
}
