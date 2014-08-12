package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.NewContract;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.*;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class HistRequestPanel extends JPanel {
    final NewContract m_contract;
    final ContractPanel m_contractPanel;
    final NewTabbedPanel m_resultsPanel;
    final UpperField m_end = new UpperField();
    final UpperField m_duration = new UpperField();
    final TCombo<Types.DurationUnit> m_durationUnit = new TCombo<Types.DurationUnit>(Types.DurationUnit.values());
    final TCombo<Types.BarSize> m_barSize = new TCombo<Types.BarSize>(Types.BarSize.values());
    final TCombo<Types.WhatToShow> m_whatToShow = new TCombo<Types.WhatToShow>(Types.WhatToShow.values());
    final JCheckBox m_rthOnly = new JCheckBox();

    public HistRequestPanel(NewTabbedPanel m_resultsPanel_external) {
        m_contract = new NewContract();     //Creates an empty contract
        //TODO m_contractPanel contains the settings of the contract, not m_contract.  It might maintain an internal copy.
        m_contractPanel = new ContractPanel(m_contract);
        m_resultsPanel = m_resultsPanel_external;

        m_end.setText("20140701 12:00:00");
        m_duration.setText("1");
        m_durationUnit.setSelectedItem(Types.DurationUnit.WEEK);
        m_barSize.setSelectedItem(Types.BarSize._1_hour);

        HtmlButton button = new HtmlButton("Request historical data") {
            @Override
            protected void actionPerformed() {
                onHistorical();
            }
        };

        VerticalPanel paramPanel = new VerticalPanel();
        paramPanel.add("End", m_end);
        paramPanel.add("Duration", m_duration);
        paramPanel.add("Duration unit", m_durationUnit);
        paramPanel.add("Bar size", m_barSize);
        paramPanel.add("What to show", m_whatToShow);
        paramPanel.add("RTH only", m_rthOnly);

        VerticalPanel butPanel = new VerticalPanel();
        butPanel.add(button);

        JPanel rightPanel = new VerticalPanel.StackPanel();
        rightPanel.add(paramPanel);
        rightPanel.add(Box.createVerticalStrut(20));
        rightPanel.add(butPanel);

        setLayout(new BoxLayout(this, BoxLayout.X_AXIS));
        //Adds the contract panel with the stock and exchange information
        add(m_contractPanel);
        add(Box.createHorizontalStrut(20));
        add(rightPanel);
    }

    protected void onHistorical() {
        m_contractPanel.onOK();
        //Instantiate new panel
        BarResultsPanel panel = new BarResultsPanel(true);
        //TODO What does this line do?
        ApiDemo.INSTANCE.controller().reqHistoricalData(m_contractPanel.m_contract, m_end.getText(), m_duration.getInt(), m_durationUnit.getSelectedItem(), m_barSize.getSelectedItem(), m_whatToShow.getSelectedItem(), m_rthOnly.isSelected(), panel);
        //ApiDemo.INSTANCE.controller().reqHistoricalData(m_contract, m_end.getText(), m_duration.getInt(), m_durationUnit.getSelectedItem(), m_barSize.getSelectedItem(), m_whatToShow.getSelectedItem(), m_rthOnly.isSelected(), panel);
        //Creates a new bar chart with the information specified
        m_resultsPanel.addTab("Historical " + m_contractPanel.m_contract.symbol(), panel, true, true);
    }
}
