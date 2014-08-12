/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo;

import static com.ib.controller.Formats.fmt;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Box;
import javax.swing.JCheckBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

import com.tws.samples.Java.apidemo.panels.*;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.Util;
import com.tws.samples.Java.apidemo.util.VerticalPanel;
import com.tws.samples.Java.apidemo.util.VerticalPanel.HorzPanel;
import com.tws.samples.Java.apidemo.util.VerticalPanel.StackPanel;

import com.ib.client.TagValue;
import com.ib.interfaces.IOrderHandler;
import com.ib.controller.NewContract;
import com.ib.controller.NewOrder;
import com.ib.controller.NewOrderState;
import com.ib.controller.OrderType;
import com.ib.controller.Types.Action;
import com.ib.controller.Types.AlgoParam;
import com.ib.controller.Types.AlgoStrategy;
import com.ib.controller.Types.ComboParam;
import com.ib.controller.Types.HedgeType;
import com.ib.controller.Types.Method;
import com.ib.controller.Types.OcaType;
import com.ib.controller.Types.ReferencePriceType;
import com.ib.controller.Types.Rule80A;
import com.ib.controller.Types.TimeInForce;
import com.ib.controller.Types.TriggerMethod;
import com.ib.controller.Types.VolatilityType;

public class TicketDlg extends JDialog {
    private boolean m_editContract;
    public static NewContract m_contract;
    public static NewOrder m_order;
    private final ContractPanel m_contractPanel;
    private final OrderPanel m_orderPanel;
    private final AdvisorTicketPanel m_advisorPanel;
    private final MiscTicketPanel m_attribTicketPanel;
    private final VolatilityTicketPanel m_volPanel;
    private final ComboTicketPanel m_comboPanel;
    private final AlgoPanel m_algoPanel;
    private final ScalePanel m_scalePanel;

    public TicketDlg(NewContract contract, NewOrder order) {
        super(ApiDemo.INSTANCE.frame());

        if (contract == null) {
            contract = new NewContract();
            m_editContract = true;
        }

        if (order == null) {
            order = new NewOrder();
            order.totalQuantity(100);
            order.lmtPrice(1);
        }

        m_contract = contract;
        m_order = order;

        m_contractPanel = new ContractPanel(m_contract);
        m_orderPanel = new OrderPanel();
        m_advisorPanel = new AdvisorTicketPanel();
        m_attribTicketPanel = new MiscTicketPanel();
        m_volPanel = new VolatilityTicketPanel();
        m_comboPanel = new ComboTicketPanel();
        m_algoPanel = new AlgoPanel();
        m_scalePanel = new ScalePanel();

        HtmlButton transmitOrder = new HtmlButton("Transmit Order") {
            @Override
            public void actionPerformed() {
                onTransmitOrder();
            }
        };

        HtmlButton checkMargin = new HtmlButton("Check Margin") {
            @Override
            public void actionPerformed() {
                onCheckMargin();
            }
        };

        HtmlButton close = new HtmlButton("Close") {
            @Override
            public void actionPerformed() {
                dispose();
            }
        };

        NewTabbedPanel tabbedPanel = new NewTabbedPanel(true);
        if (m_editContract) {
            tabbedPanel.addTab("Contract", m_contractPanel);
        }
        tabbedPanel.addTab("Order", m_orderPanel);
        tabbedPanel.addTab("Misc", m_attribTicketPanel);
        tabbedPanel.addTab("Advisor", m_advisorPanel);
        tabbedPanel.addTab("Volatility", m_volPanel);
        if (m_contract.isCombo()) {
            tabbedPanel.addTab("Combo", m_comboPanel);
        }
        tabbedPanel.addTab("Scale", m_scalePanel);
        tabbedPanel.addTab("IB Algo", m_algoPanel);

        JPanel buts = new JPanel(new FlowLayout(FlowLayout.CENTER, 15, 5));
        buts.add(transmitOrder);
        buts.add(checkMargin);
        buts.add(close);

        // check-margin is for new orders only
        if (m_order.orderId() != 0) {
            checkMargin.setVisible(false);
        }

        add(tabbedPanel);
        add(buts, BorderLayout.SOUTH);

        setLocation(200, 200);
        pack();
        Util.closeOnEsc(this);
    }

    protected void onTransmitOrder() {
        scrape();

        // close window right away for mods
        if (m_order.orderId() != 0) {
            dispose();
        }

        ApiDemo.INSTANCE.controller().placeOrModifyOrder(m_contract, m_order, new IOrderHandler() {
            @Override
            public void orderState(NewOrderState orderState) {
                ApiDemo.INSTANCE.controller().removeOrderHandler(this);
                SwingUtilities.invokeLater(new Runnable() {
                    @Override
                    public void run() {
                        dispose();
                    }
                });
            }

            @Override
            public void handle(int errorCode, final String errorMsg) {
                m_order.orderId(0);
                SwingUtilities.invokeLater(new Runnable() {
                    @Override
                    public void run() {
                        JOptionPane.showMessageDialog(TicketDlg.this, errorMsg);
                    }
                });
            }
        });
    }

    protected void onCheckMargin() {
        scrape();

        m_order.whatIf(true);
        ApiDemo.INSTANCE.controller().placeOrModifyOrder(m_contract, m_order, new IOrderHandler() {
            @Override
            public void orderState(final NewOrderState orderState) {
                SwingUtilities.invokeLater(new Runnable() {
                    @Override
                    public void run() {
                        displayMargin(orderState);
                    }
                });
            }

            @Override
            public void handle(int errorCode, final String errorMsg) {
                SwingUtilities.invokeLater(new Runnable() {
                    @Override
                    public void run() {
                        JOptionPane.showMessageDialog(TicketDlg.this, errorMsg);
                    }
                });
            }
        });

        m_order.whatIf(false);
        m_order.orderId(0);
    }

    protected void displayMargin(NewOrderState orderState) {
        String str = String.format("Equity with loan: %s\n\nInitial margin: %s\nMaintenance margin: %s\n",
                fmt(Double.parseDouble(orderState.equityWithLoan())),
                fmt(Double.parseDouble(orderState.initMargin())),
                fmt(Double.parseDouble(orderState.maintMargin())));

        JOptionPane.showMessageDialog(this, str, "Post-Trade Margin Requirements", JOptionPane.INFORMATION_MESSAGE);
    }

    private void scrape() {
        m_order.smartComboRoutingParams().clear();

        if (m_editContract) {
            m_contractPanel.onOK();
        }
        m_orderPanel.onOK();
        m_advisorPanel.onOK();
        m_attribTicketPanel.onOK();
        m_volPanel.onOK();
        m_algoPanel.onOK();
        m_scalePanel.onOK();
        if (m_contract.isCombo()) {
            m_comboPanel.onOK();
        }
    }


    public static String getVal(ComboParam param) {
        if (m_order.smartComboRoutingParams() != null) {
            for (TagValue tv : m_order.smartComboRoutingParams()) {
                if (tv.m_tag.equals(param.toString())) {
                    return tv.m_value;
                }
            }
        }
        return "";
    }
}
