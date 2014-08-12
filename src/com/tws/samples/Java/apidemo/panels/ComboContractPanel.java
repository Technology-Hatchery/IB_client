package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.NewContract;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/12/2014.
 */
public class ComboContractPanel extends ContractPanel {
    ComboContractPanel(NewContract m_contract) {
        super(m_contract);
        removeAll();

        VerticalPanel p1 = new VerticalPanel();
        p1.setAlignmentY(0);
        p1.add("Action", SpreadsPanel.m_action);
        p1.add("Ratio", SpreadsPanel.m_ratio);
        p1.add("Symbol", m_symbol);
        p1.add("Sec type", m_secType);
        p1.add("Expiry", m_expiry);
        p1.add("Strike", m_strike);

        VerticalPanel p2 = new VerticalPanel();
        p2.setAlignmentY(0);
        p2.add("Put/call", m_right);
        p2.add("Multiplier", m_multiplier);
        p2.add("Exchange", m_exchange);
        p2.add("Currency", m_currency);
        p2.add("Local symbol", m_localSymbol);

        setLayout(new BoxLayout(this, BoxLayout.X_AXIS));
        add(p1);
        add(p2);
    }
}
