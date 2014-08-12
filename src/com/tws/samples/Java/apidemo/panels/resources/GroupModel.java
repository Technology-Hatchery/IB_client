package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.Group;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.AdvisorPanel;
import com.tws.samples.Java.apidemo.util.TCombo;

import javax.swing.*;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableCellEditor;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class GroupModel extends AbstractTableModel {
    TCombo<Types.Method> combo = new TCombo<Types.Method>(Types.Method.values());
    DefaultCellEditor EDITOR = new DefaultCellEditor(combo);
    ArrayList<Group> m_groups = new ArrayList<Group>();

    public GroupModel() {
        EDITOR.setClickCountToStart(1);
    }

    public void update(ArrayList<Group> groups) {
        m_groups.clear();
        m_groups.addAll(groups);
        fireTableDataChanged();
    }

    void add(String name) {
        Group group = new Group();
        group.name(name);
        m_groups.add(group);
        fireTableDataChanged();
    }

    public void transmit() {
        ApiDemo.INSTANCE.controller().updateGroups(m_groups);
    }

    @Override
    public int getRowCount() {
        return m_groups.size();
    }

    @Override
    public int getColumnCount() {
        return 3;
    }

    @Override
    public String getColumnName(int col) {
        switch (col) {
            case 0:
                return "Name";
            case 1:
                return "Default Method";
            case 2:
                return "Accounts";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        Group row = m_groups.get(rowIn);
        switch (col) {
            case 0:
                return row.name();
            case 1:
                return row.defaultMethod();
            case 2:
                return row.accounts().toString().substring(1, row.accounts().toString().length() - 1);
            default:
                return null;
        }
    }

    @Override
    public boolean isCellEditable(int rowIndex, int col) {
        return true;
    }

    public TableCellEditor getCellEditor(int row, int col) {
        return col == 1 ? EDITOR : AdvisorPanel.DEF_CELL_EDITOR;
    }

    @Override
    public void setValueAt(Object val, int rowIn, int col) {
        Group row = m_groups.get(rowIn);
        switch (col) {
            case 0:
                row.name((String) val);
                break;
            case 1:
                row.defaultMethod((Types.Method) val);
                break;
            case 2:
                row.setAllAccounts((String) val);
                break;
        }
    }
}
