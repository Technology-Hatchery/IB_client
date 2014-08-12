package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.NewContract;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class TopRequestPanel extends JPanel {
    final NewContract m_contract = new NewContract();
    final ContractPanel m_contractPanel = new ContractPanel(m_contract);

    public TopRequestPanel() {
        HtmlButton reqTop = new HtmlButton("Request Top Market Data") {
            @Override
            protected void actionPerformed() {
                onTop();
            }
        };

        VerticalPanel butPanel = new VerticalPanel();
        butPanel.add(reqTop);

        setLayout(new BoxLayout(this, BoxLayout.X_AXIS));
        add(m_contractPanel);
        add(Box.createHorizontalStrut(20));
        add(butPanel);
    }

    protected void onTop() {
        m_contractPanel.onOK();
        if (MarketDataPanel.m_topResultPanel == null) {
            MarketDataPanel.m_topResultPanel = new TopResultsPanel();
            MarketDataPanel.m_resultsPanel.addTab("Top Data", MarketDataPanel.m_topResultPanel, true, true);
        }

        MarketDataPanel.m_topResultPanel.m_model.addRow(m_contract);
    }
}
