package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.NewContract;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.OptionChainsPanel;
import com.tws.samples.Java.apidemo.util.Util;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import static com.ib.controller.Formats.fmtNz;
import static com.ib.controller.Formats.fmtPct;

/**
 * Created by Alfred on 8/11/2014.
 */
public class ChainModel extends AbstractTableModel {
    Comparator<ChainRow> c = new Comparator<ChainRow>() {
        @Override
        public int compare(ChainRow o1, ChainRow o2) {
            int rc = o1.m_c.expiry().compareTo(o2.m_c.expiry());
            if (rc == 0) {
                if (o1.m_c.strike() < o2.m_c.strike()) {
                    rc = -1;
                }
                if (o1.m_c.strike() > o2.m_c.strike()) {
                    rc = 1;
                }
            }
            return rc;
        }
    };

    ArrayList<ChainRow> m_list = new ArrayList<ChainRow>();

    public void desubscribe() {
        for (ChainRow row : m_list) {
            ApiDemo.INSTANCE.controller().cancelOptionMktData(row);
        }
    }

    @Override
    public int getRowCount() {
        return m_list.size();
    }

    public void sort() {
        Collections.sort(m_list, c);
        fireTableDataChanged();
    }

    public void addRow(NewContract contract, boolean snapshot) {
        ChainRow row = new ChainRow(contract);
        m_list.add(row);

        ApiDemo.INSTANCE.controller().reqOptionMktData(contract, "", snapshot, row);

        if (snapshot) {
            Util.sleep(11); // try to avoid pacing violation at TWS
        }
    }

    @Override
    public int getColumnCount() {
        return OptionChainsPanel.m_snapshot.isSelected() ? 10 : 9;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Expiry";
            case 1:
                return "Strike";
            case 2:
                return "Bid";
            case 3:
                return "Ask";
            case 4:
                return "Imp Vol";
            case 5:
                return "Delta";
            case 6:
                return "Gamma";
            case 7:
                return "Vega";
            case 8:
                return "Theta";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        ChainRow row = m_list.get(rowIn);
        switch (col) {
            case 0:
                return row.m_c.expiry();
            case 1:
                return row.m_c.strike();
            case 2:
                return fmtNz(row.m_bid);
            case 3:
                return fmtNz(row.m_ask);
            case 4:
                return fmtPct(row.m_impVol);
            case 5:
                return fmtNz(row.m_delta);
            case 6:
                return fmtNz(row.m_gamma);
            case 7:
                return fmtNz(row.m_vega);
            case 8:
                return fmtNz(row.m_theta);
            case 9:
                return row.m_done ? "*" : null;
            default:
                return null;
        }
    }


}
