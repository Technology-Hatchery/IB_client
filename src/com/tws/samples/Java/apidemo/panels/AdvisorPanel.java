/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.util.ArrayList;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.DefaultCellEditor;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;
import javax.swing.border.TitledBorder;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.TableCellEditor;


import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.*;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.VerticalPanel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.NewTabPanel;

import com.ib.controller.Alias;
import com.ib.controller.Group;
import com.ib.controller.Profile;
import com.ib.interfaces.IAdvisorHandler;
import com.ib.controller.Profile.Type;
import com.ib.controller.Types.FADataType;
import com.ib.controller.Types.Method;

public class AdvisorPanel extends NewTabPanel implements IAdvisorHandler {
    public static DefaultCellEditor DEF_CELL_EDITOR = new DefaultCellEditor(new JTextField());

    static {
        DEF_CELL_EDITOR.setClickCountToStart(1);
    }

    public static GroupModel m_groupModel = new GroupModel();
    public static ProfileModel m_profileModel = new ProfileModel();
    private static AliasModel m_aliasModel = new AliasModel();

    public static JTable m_groupTable = new JTable(m_groupModel) {
        public TableCellEditor getCellEditor(int row, int col) {
            return m_groupModel.getCellEditor(row, col);
        }
    };

    public static JTable m_profileTable = new JTable(m_profileModel) {
        public TableCellEditor getCellEditor(int row, int col) {
            return m_profileModel.getCellEditor(row, col);
        }
    };

    private final JTable m_aliasTable = new JTable(m_aliasModel);

    public AdvisorPanel() {
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
        mainPanel.setBorder(new EmptyBorder(0, 10, 0, 0));
        mainPanel.add(new GroupsPanel());
        mainPanel.add(Box.createVerticalStrut(10));
        mainPanel.add(new ProfilesPanel());

        JScrollPane aliasScroll = new JScrollPane(m_aliasTable);
        aliasScroll.setBorder(new TitledBorder("Aliases"));
        aliasScroll.setPreferredSize(new Dimension(300, 2000));

        setLayout(new BorderLayout());
        add(aliasScroll, BorderLayout.WEST);
        add(mainPanel);
    }

    /**
     * Called when the tab is first visited.
     */
    @Override
    public void activated() {
        ApiDemo.INSTANCE.controller().reqAdvisorData(FADataType.GROUPS, this);
        ApiDemo.INSTANCE.controller().reqAdvisorData(FADataType.PROFILES, this);
        ApiDemo.INSTANCE.controller().reqAdvisorData(FADataType.ALIASES, this);
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
    }

    public void groups(ArrayList<Group> groups) {
        m_groupModel.update(groups);
    }

    public void profiles(ArrayList<Profile> profiles) {
        m_profileModel.update(profiles);
    }

    public void aliases(ArrayList<Alias> aliases) {
        m_aliasModel.update(aliases);
    }


}
