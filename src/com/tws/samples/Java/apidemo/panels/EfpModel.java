package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.NewContract;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.EfpRow;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class EfpModel extends AbstractTableModel {
    ArrayList<EfpRow> m_rows = new ArrayList<EfpRow>();

    void addRow(NewContract contract) {
        EfpRow row = new EfpRow(this, contract.description());
        m_rows.add(row);
        ApiDemo.INSTANCE.controller().reqEfpMktData(contract, "", false, row);
        fireTableRowsInserted(m_rows.size() - 1, m_rows.size() - 1);
    }

    @Override
    public int getRowCount() {
        return m_rows.size();
    }

    @Override
    public int getColumnCount() {
        return 10;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Description";
            case 1:
                return "Bid";
            case 2:
                return "Ask";
            case 3:
                return "Basis Points";
            case 4:
                return "Formatted";
            case 5:
                return "Implied Future";
            case 6:
                return "Hold Days";
            case 7:
                return "Future Expiry";
            case 8:
                return "Dividend Impact";
            case 9:
                return "Dividends to Expiry";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        EfpRow row = m_rows.get(rowIn);

        switch (col) {
            case 0:
                return row.m_description;
            case 1:
                return row.m_bid;
            case 2:
                return row.m_ask;
            case 3:
                return row.m_basisPoints;
            case 4:
                return row.m_formattedBasisPoints;
            case 5:
                return row.m_impliedFuture;
            case 6:
                return row.m_holdDays;
            case 7:
                return row.m_futureExpiry;
            case 8:
                return row.m_dividendImpact;
            case 9:
                return row.m_dividendsToExpiry;
            default:
                return null;
        }
    }


}
