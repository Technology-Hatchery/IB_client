/* Copyright (C) 2013 Interactive Brokers LLC. All rights reserved.  This code is subject to the terms
 * and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable. */

package com.tws.samples.Java.apidemo.panels;

import static com.ib.controller.Formats.fmt0;

import java.awt.BorderLayout;
import java.awt.Dimension;

import javax.swing.DefaultListModel;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.border.TitledBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;


import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.MarginModel;
import com.tws.samples.Java.apidemo.panels.resources.MktValModel;
import com.tws.samples.Java.apidemo.panels.resources.PortfolioModel;
import com.tws.samples.Java.apidemo.panels.resources.Table;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel.INewTab;

import com.ib.controller.MarketValueTag;
import com.ib.controller.Position;
import com.ib.interfaces.IAccountHandler;

public class AccountInfoPanel extends JPanel implements INewTab, IAccountHandler {
    private DefaultListModel m_acctList = new DefaultListModel();
    private JList m_accounts = new JList(m_acctList);
    private String m_selAcct = "";
    private MarginModel m_marginModel = new MarginModel();
    private JTable m_marginTable = new Table(m_marginModel);
    private PortfolioModel m_portfolioModel = new PortfolioModel();
    private JTable m_portfolioTable = new Table(m_portfolioModel);
    private MktValModel m_mktValModel = new MktValModel();
    private JTable m_mktValTable = new Table(m_mktValModel, 2);
    private JLabel m_lastUpdated = new JLabel();

    public AccountInfoPanel() {
        m_lastUpdated.setHorizontalAlignment(SwingConstants.RIGHT);

        m_accounts.setPreferredSize(new Dimension(10000, 100));
        JScrollPane acctScroll = new JScrollPane(m_accounts);
        acctScroll.setBorder(new TitledBorder("Select Account"));

        JScrollPane marginScroll = new JScrollPane(m_marginTable);
        JScrollPane mvScroll = new JScrollPane(m_mktValTable);
        JScrollPane portScroll = new JScrollPane(m_portfolioTable);

        NewTabbedPanel tabbedPanel = new NewTabbedPanel();
        tabbedPanel.addTab("Balances and Margin", marginScroll);
        tabbedPanel.addTab("Market Value", mvScroll);
        tabbedPanel.addTab("Portfolio", portScroll);
        tabbedPanel.addTab("Account Summary", new AccountSummaryPanel());
        tabbedPanel.addTab("Market Value Summary", new MarketValueSummaryPanel());
        tabbedPanel.addTab("Positions (all accounts)", new PositionsPanel());

        setLayout(new BorderLayout());
        add(acctScroll, BorderLayout.NORTH);
        add(tabbedPanel);
        add(m_lastUpdated, BorderLayout.SOUTH);

        m_accounts.addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent e) {
                onChanged();
            }
        });
    }

    /**
     * Called when the tab is first visited.
     */
    @Override
    public void activated() {
        for (String account : ApiDemo.INSTANCE.accountList()) {
            m_acctList.addElement(account);
        }

        if (ApiDemo.INSTANCE.accountList().size() == 1) {
            m_accounts.setSelectedIndex(0);
        }
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
    }

    protected synchronized void onChanged() {
        int i = m_accounts.getSelectedIndex();
        if (i != -1) {
            String selAcct = (String) m_acctList.get(i);
            if (!selAcct.equals(m_selAcct)) {
                m_selAcct = selAcct;
                m_marginModel.clear();
                m_mktValModel.clear();
                m_portfolioModel.clear();
                ApiDemo.INSTANCE.controller().reqAccountUpdates(true, m_selAcct, this);
            }
        }
    }

    /**
     * Receive account value.
     */
    public synchronized void accountValue(String account, String tag, String value, String currency) {
        if (account.equals(m_selAcct)) {
            try {
                MarketValueTag mvTag = MarketValueTag.valueOf(tag);
                m_mktValModel.handle(account, currency, mvTag, value);
            } catch (Exception e) {
                m_marginModel.handle(tag, value, currency, account);
            }
        }
    }

    /**
     * Receive position.
     */
    public synchronized void updatePortfolio(Position position) {
        if (position.account().equals(m_selAcct)) {
            m_portfolioModel.update(position);
        }
    }

    /**
     * Receive time of last update.
     */
    public void accountTime(String timeStamp) {
        m_lastUpdated.setText("Last updated: " + timeStamp + "       ");
    }

    public void accountDownloadEnd(String account) {
    }


//	private static class MktValKey {
//		String m_account;
//		String m_currency;
//
//		public MktValKey(String account, String currency) {
//			m_account = account;
//			m_currency = currency;
//		}
//
//		@Override public int hashCode() {
//			return m_account.hashCode() + m_currency.hashCode();
//		}
//		
//		@Override public boolean equals(Object obj) {
//			MktValKey other = (MktValKey)obj;
//			return m_account.equals( other.m_account) && m_currency.equals( other.m_currency);
//		}
//	}


    public static boolean isZero(String value) {
        try {
            return Double.parseDouble(value) == 0;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * If val is a number, format it with commas and no decimals.
     */
    public static String format(String val, String currency) {
        if (val == null || val.length() == 0) {
            return null;
        }

        try {
            double dub = Double.parseDouble(val);
            val = fmt0(dub);
        } catch (Exception e) {
        }

        return currency != null && currency.length() > 0
                ? val + " " + currency : val;
    }


}
