package com.tws.samples.Java.apidemo.panels.resources;

import com.tws.samples.Java.apidemo.panels.TradesPanel;

import javax.swing.table.AbstractTableModel;

/**
 * Created by Alfred on 8/11/2014.
 */
public class Model extends AbstractTableModel {
    @Override
    public int getRowCount() {
        return TradesPanel.m_trades.size();
    }

    @Override
    public int getColumnCount() {
        return 7;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Date/Time";
            case 1:
                return "Account";
            case 2:
                return "Action";
            case 3:
                return "Quantity";
            case 4:
                return "Description";
            case 5:
                return "Price";
            case 6:
                return "Commission";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int row, int col) {
        FullExec full = TradesPanel.m_trades.get(row);

        switch (col) {
            case 0:
                return full.m_trade.m_time;
            case 1:
                return full.m_trade.m_acctNumber;
            case 2:
                return full.m_trade.m_side;
            case 3:
                return full.m_trade.m_shares;
            case 4:
                return full.m_contract.description();
            case 5:
                return full.m_trade.m_price;
            case 6:
                return full.m_commissionReport != null ? full.m_commissionReport.m_commission : null;
            default:
                return null;
        }
    }
}
