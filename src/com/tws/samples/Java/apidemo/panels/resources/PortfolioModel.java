package com.tws.samples.Java.apidemo.panels.resources;

/**
 * Created by Alfred on 8/11/2014.
 */

import com.ib.controller.Position;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.panels.AccountInfoPanel;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Shared with ExercisePanel.
 */
public class PortfolioModel extends AbstractTableModel {
    private HashMap<Integer, Position> m_portfolioMap = new HashMap<Integer, Position>();
    private ArrayList<Integer> m_positions = new ArrayList<Integer>(); // must store key because Position is overwritten

    public void clear() {
        m_positions.clear();
        m_portfolioMap.clear();
    }

    public Position getPosition(int i) {
        return m_portfolioMap.get(m_positions.get(i));
    }

    public void update(Position position) {
        // skip fake FX positions
        if (position.contract().secType() == Types.SecType.CASH) {
            return;
        }

        if (!m_portfolioMap.containsKey(position.conid()) && position.position() != 0) {
            m_positions.add(position.conid());
        }
        m_portfolioMap.put(position.conid(), position);
        fireTableDataChanged();
    }

    @Override
    public int getRowCount() {
        return m_positions.size();
    }

    @Override
    public int getColumnCount() {
        return 7;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Description";
            case 1:
                return "Position";
            case 2:
                return "Price";
            case 3:
                return "Value";
            case 4:
                return "Avg Cost";
            case 5:
                return "Unreal Pnl";
            case 6:
                return "Real Pnl";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int row, int col) {
        Position pos = getPosition(row);
        switch (col) {
            case 0:
                return pos.contract().description();
            case 1:
                return pos.position();
            case 2:
                return pos.marketPrice();
            case 3:
                return AccountInfoPanel.format("" + pos.marketValue(), null);
            case 4:
                return pos.averageCost();
            case 5:
                return pos.unrealPnl();
            case 6:
                return pos.realPnl();
            default:
                return null;
        }
    }
}
