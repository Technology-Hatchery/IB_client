/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.border.TitledBorder;
import javax.swing.table.AbstractTableModel;


import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.panels.EfpPanel;
import com.tws.samples.Java.apidemo.panels.SpreadsPanel;
import com.tws.samples.Java.apidemo.panels.resources.OrderRow;
import com.tws.samples.Java.apidemo.panels.resources.OrdersModel;
import com.tws.samples.Java.apidemo.panels.resources.TopRow;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.INewTab;
import com.tws.samples.Java.apidemo.util.VerticalPanel.HorzPanel;

import com.ib.controller.DeltaNeutralContract;
import com.ib.controller.NewComboLeg;
import com.ib.controller.NewContract;
import com.ib.controller.NewContractDetails;
import com.ib.controller.NewOrder;
import com.ib.controller.NewOrderState;
import com.ib.interfaces.IContractDetailsHandler;
import com.ib.interfaces.IEfpHandler;
import com.ib.controller.Types.Action;
import com.ib.controller.Types.SecType;


public class ComboPanel extends JPanel implements INewTab {
    private final OrdersModel m_ordersModel = new OrdersModel() {
        @Override
        protected boolean shouldAdd(NewContract contract, NewOrder order, NewOrderState orderState) {
            return contract.isCombo();
        }
    };

    public ComboPanel() {
        NewTabbedPanel tabs = new NewTabbedPanel();
        tabs.addTab("Spreads", new SpreadsPanel());
        tabs.addTab("EFP's", new EfpPanel());

        final JTable ordersTable = new JTable(m_ordersModel);
        JScrollPane ordersScroll = new JScrollPane(ordersTable);
        ordersScroll.setBorder(new TitledBorder("Live Combo Orders"));

        ordersTable.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount() == 2) {
                    onDoubleClick(ordersTable.getSelectedRow());
                }
            }
        });

        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
        add(tabs);
        add(ordersScroll);
    }

    /**
     * Called when the tab is first visited.
     */
    @Override
    public void activated() {
        ApiDemo.INSTANCE.controller().reqLiveOrders(m_ordersModel);
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
    }

    protected void onDoubleClick(int row) {
        if (row != -1) {
            OrderRow order = m_ordersModel.get(row);
            TicketDlg dlg = new TicketDlg(order.m_contract, order.m_order);
            dlg.setVisible(true);
        }
    }


}
