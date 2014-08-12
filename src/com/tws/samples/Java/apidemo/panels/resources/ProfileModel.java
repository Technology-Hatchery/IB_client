package com.tws.samples.Java.apidemo.panels.resources;

import com.ib.controller.Profile;
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
public class ProfileModel extends AbstractTableModel {
    TCombo<Profile.Type> combo = new TCombo<Profile.Type>(Profile.Type.values());
    DefaultCellEditor EDITOR = new DefaultCellEditor(combo);
    ArrayList<Profile> m_profiles = new ArrayList<Profile>();

    public ProfileModel() {
        EDITOR.setClickCountToStart(1);
        combo.removeItemAt(0);
    }

    public void update(ArrayList<Profile> profiles) {
        m_profiles.clear();
        m_profiles.addAll(profiles);
        fireTableDataChanged();
    }

    public void add(String name) {
        Profile profile = new Profile();
        profile.name(name);
        m_profiles.add(profile);
        fireTableDataChanged();
    }

    public void transmit() {
        ApiDemo.INSTANCE.controller().updateProfiles(m_profiles);
    }

    @Override
    public int getRowCount() {
        return m_profiles.size();
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
                return "Type";
            case 2:
                return "Allocations";
            default:
                return null;
        }
    }

    @Override
    public Object getValueAt(int rowIn, int col) {
        Profile row = m_profiles.get(rowIn);
        switch (col) {
            case 0:
                return row.name();
            case 1:
                return row.type();
            case 2:
                return row.allocations().toString().substring(1, row.allocations().toString().length() - 1);
            default:
                return null;
        }
    }

    @Override
    public boolean isCellEditable(int rowIndex, int columnIndex) {
        return true;
    }

    public TableCellEditor getCellEditor(int row, int col) {
        return col == 1 ? EDITOR : AdvisorPanel.DEF_CELL_EDITOR;
    }

    @Override
    public void setValueAt(Object val, int rowIn, int col) {
        Profile row = m_profiles.get(rowIn);
        switch (col) {
            case 0:
                row.name((String) val);
                break;
            case 1:
                row.type((Profile.Type) val);
                break;
            case 2:
                row.setAllocations((String) val);
                break;
        }
    }
}
