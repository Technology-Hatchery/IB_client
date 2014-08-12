/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import java.awt.BorderLayout;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.TitledBorder;
import javax.swing.table.AbstractTableModel;


import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.panels.resources.OrderRow;
import com.tws.samples.Java.apidemo.panels.resources.OrdersModel;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import com.ib.controller.NewContract;
import com.ib.controller.NewOrder;
import com.ib.controller.NewOrderState;
import com.ib.controller.OrderStatus;
import com.ib.controller.OrderType;
import com.ib.interfaces.ILiveOrderHandler;

public class OrdersPanel extends JPanel {
    private OrdersModel m_model = new OrdersModel();
    private JTable m_table = new JTable(m_model);

    public OrdersPanel() {
        JScrollPane scroll = new JScrollPane(m_table);
        scroll.setBorder(new TitledBorder("Live Orders"));

        m_table.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount() == 2) {
                    onDoubleClick();
                }
            }
        });

        HtmlButton ticket = new HtmlButton("Place New Order") {
            @Override
            public void actionPerformed() {
                onPlaceOrder();
            }
        };

        HtmlButton modify = new HtmlButton("Modify Selected Order") {
            @Override
            public void actionPerformed() {
                onDoubleClick();
            }
        };

        HtmlButton attach = new HtmlButton("Attach New Order to Selected Order") {
            @Override
            public void actionPerformed() {
                onAttachOrder();
            }
        };

        HtmlButton reqExisting = new HtmlButton("Take Over Existing TWS Orders") {
            @Override
            public void actionPerformed() {
                onTakeOverExisting();
            }
        };

        HtmlButton reqFuture = new HtmlButton("Take Over Future TWS Orders") {
            @Override
            public void actionPerformed() {
                onTakeOverFuture();
            }
        };

        HtmlButton cancel = new HtmlButton("Cancel Selected Order") {
            @Override
            public void actionPerformed() {
                onCancel();
            }
        };

        HtmlButton cancelAll = new HtmlButton("Cancel All Orders") {
            @Override
            public void actionPerformed() {
                onCancelAll();
            }
        };

        HtmlButton refresh = new HtmlButton("Refresh") {
            @Override
            public void actionPerformed() {
                onRefresh();
            }
        };

        JPanel buts = new VerticalPanel();
        buts.add(ticket);
        buts.add(modify);
        buts.add(attach);
        buts.add(cancel);
        buts.add(cancelAll);
        buts.add(reqExisting);
        buts.add(reqFuture);
        buts.add(refresh);

        setLayout(new BorderLayout());
        add(buts, BorderLayout.EAST);
        add(scroll);
    }

    protected void onDoubleClick() {
        OrderRow order = getSelectedOrder();
        if (order != null) {
            TicketDlg dlg = new TicketDlg(order.m_contract, order.m_order);
            dlg.setVisible(true);
        }
    }

    protected void onTakeOverExisting() {
        ApiDemo.INSTANCE.controller().takeTwsOrders(m_model);
    }

    protected void onTakeOverFuture() {
        ApiDemo.INSTANCE.controller().takeFutureTwsOrders(m_model);
    }

    protected void onCancel() {
        OrderRow order = getSelectedOrder();
        if (order != null) {
            ApiDemo.INSTANCE.controller().cancelOrder(order.m_order.orderId());
        }
    }

    protected void onCancelAll() {
        ApiDemo.INSTANCE.controller().cancelAllOrders();
    }

    private OrderRow getSelectedOrder() {
        int i = m_table.getSelectedRow();
        return i != -1 ? m_model.get(i) : null;
    }

    public void activated() {
        onRefresh();
    }

    private static void onPlaceOrder() {
        TicketDlg dlg = new TicketDlg(null, null);
        dlg.setVisible(true);
    }

    protected void onAttachOrder() {
        OrderRow row = getSelectedOrder();
        if (row != null) {
            NewOrder parent = row.m_order;

            NewOrder child = new NewOrder();
            child.parentId(parent.orderId());
            child.action(parent.action());
            child.totalQuantity(parent.totalQuantity());
            child.orderType(OrderType.TRAIL);
            child.auxPrice(1);

            TicketDlg dlg = new TicketDlg(row.m_contract.clone(), child);
            dlg.setVisible(true);
        }
    }

    protected void onRefresh() {
        m_model.clear();
        m_model.fireTableDataChanged();
        ApiDemo.INSTANCE.controller().reqLiveOrders(m_model);
    }


}
