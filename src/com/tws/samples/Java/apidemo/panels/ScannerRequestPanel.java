package com.tws.samples.Java.apidemo.panels;

import com.ib.client.ScannerSubscription;
import com.ib.controller.Instrument;
import com.ib.controller.ScanCode;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;
import java.awt.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class ScannerRequestPanel extends JPanel {
    final UpperField m_numRows = new UpperField("15");
    final TCombo<ScanCode> m_scanCode = new TCombo<ScanCode>(ScanCode.values());
    final TCombo<Instrument> m_instrument = new TCombo<Instrument>(Instrument.values());
    final UpperField m_location = new UpperField("STK.US.MAJOR", 9);
    final TCombo<String> m_stockType = new TCombo<String>("ALL", "STOCK", "ETF");

    public ScannerRequestPanel() {
        HtmlButton go = new HtmlButton("Go") {
            @Override
            protected void actionPerformed() {
                onGo();
            }
        };

        VerticalPanel paramsPanel = new VerticalPanel();
        paramsPanel.add("Scan code", m_scanCode);
        paramsPanel.add("Instrument", m_instrument);
        paramsPanel.add("Location", m_location, Box.createHorizontalStrut(10), go);
        paramsPanel.add("Stock type", m_stockType);
        paramsPanel.add("Num rows", m_numRows);

        setLayout(new BorderLayout());
        add(paramsPanel, BorderLayout.NORTH);
    }

    protected void onGo() {
        ScannerSubscription sub = new ScannerSubscription();
        sub.numberOfRows(m_numRows.getInt());
        sub.scanCode(m_scanCode.getSelectedItem().toString());
        sub.instrument(m_instrument.getSelectedItem().toString());
        sub.locationCode(m_location.getText());
        sub.stockTypeFilter(m_stockType.getSelectedItem().toString());

        ScannerResultsPanel resultsPanel = new ScannerResultsPanel();
        MarketDataPanel.m_resultsPanel.addTab(sub.scanCode(), resultsPanel, true, true);

        ApiDemo.INSTANCE.controller().reqScannerSubscription(sub, resultsPanel);
    }
}
