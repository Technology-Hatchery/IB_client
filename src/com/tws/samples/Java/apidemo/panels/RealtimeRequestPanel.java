package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.NewContract;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class RealtimeRequestPanel extends JPanel {
    final NewContract m_contract = new NewContract();
    final ContractPanel m_contractPanel = new ContractPanel(m_contract);
    final TCombo<Types.WhatToShow> m_whatToShow = new TCombo<Types.WhatToShow>(Types.WhatToShow.values());
    final JCheckBox m_rthOnly = new JCheckBox();

    public RealtimeRequestPanel() {
        HtmlButton button = new HtmlButton("Request real-time bars") {
            @Override
            protected void actionPerformed() {
                onRealTime();
            }
        };

        VerticalPanel paramPanel = new VerticalPanel();
        paramPanel.add("What to show", m_whatToShow);
        paramPanel.add("RTH only", m_rthOnly);

        VerticalPanel butPanel = new VerticalPanel();
        butPanel.add(button);

        JPanel rightPanel = new VerticalPanel.StackPanel();
        rightPanel.add(paramPanel);
        rightPanel.add(Box.createVerticalStrut(20));
        rightPanel.add(butPanel);

        setLayout(new BoxLayout(this, BoxLayout.X_AXIS));
        add(m_contractPanel);
        add(Box.createHorizontalStrut(20));
        add(rightPanel);
    }

    protected void onRealTime() {
        m_contractPanel.onOK();
        BarResultsPanel panel = new BarResultsPanel(false);
        ApiDemo.INSTANCE.controller().reqRealTimeBars(m_contract, m_whatToShow.getSelectedItem(), m_rthOnly.isSelected(), panel);
        MarketDataPanel.m_resultsPanel.addTab("Real-time " + m_contract.symbol(), panel, true, true);
    }
}
