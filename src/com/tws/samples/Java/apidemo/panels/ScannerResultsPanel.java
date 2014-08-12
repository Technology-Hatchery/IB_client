package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.NewContractDetails;
import com.ib.interfaces.IScannerHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.TopModel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;

import javax.swing.*;
import java.awt.*;
import java.io.File;
import java.io.FileWriter;
import java.util.HashSet;

/**
 * Created by Alfred on 8/11/2014.
 */
public class ScannerResultsPanel extends NewTabbedPanel.NewTabPanel implements IScannerHandler {
    final HashSet<Integer> m_conids = new HashSet<Integer>();
    final TopModel m_model = new TopModel();

    ScannerResultsPanel() {
        JTable table = new JTable(m_model);
        JScrollPane scroll = new JScrollPane(table);
        setLayout(new BorderLayout());
        add(scroll);
    }

    /**
     * Called when the tab is first visited.
     */
    @Override
    public void activated() {
    }

    /**
     * Called when the tab is closed by clicking the X.
     */
    @Override
    public void closed() {
        ApiDemo.INSTANCE.controller().cancelScannerSubscription(this);
        m_model.desubscribe();
    }

    @Override
    public void scannerParameters(String xml) {
        try {
            File file = File.createTempFile("pre", ".xml");
            FileWriter writer = new FileWriter(file);
            writer.write(xml);
            writer.close();

            Desktop.getDesktop().open(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void scannerData(int rank, final NewContractDetails contractDetails, String legsStr) {
        if (!m_conids.contains(contractDetails.conid())) {
            m_conids.add(contractDetails.conid());
            SwingUtilities.invokeLater(new Runnable() {
                @Override
                public void run() {
                    m_model.addRow(contractDetails.contract());
                }
            });
        }
    }

    @Override
    public void scannerDataEnd() {
        // we could sort here
    }
}
