package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.*;
import com.ib.interfaces.IContractDetailsHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.panels.resources.ChainModel;
import com.tws.samples.Java.apidemo.util.NewTabbedPanel;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class ChainPanel extends NewTabbedPanel.NewTabPanel implements IContractDetailsHandler, ActionListener {
    ChainModel m_putsModel = new ChainModel();
    JTable m_putsTable = new JTable(m_putsModel);
    ChainModel m_callsModel = new ChainModel();
    JTable m_callsTable = new JTable(m_callsModel);
    Timer m_timer = new Timer(800, this);
    JLabel m_labUnderPrice = new JLabel();
    ApiController.TopMktDataAdapter m_stockListener = new ApiController.TopMktDataAdapter() {
        @Override
        public void tickPrice(NewTickType tickType, double price, int canAutoExecute) {
            if (tickType == NewTickType.LAST) {
                m_labUnderPrice.setText("" + price);
            }
        }
    };

    public ChainPanel() {
        JScrollPane scrollPuts = new JScrollPane(m_putsTable);
        scrollPuts.setBorder(new TitledBorder("Puts"));

        JScrollPane scrollCalls = new JScrollPane(m_callsTable);
        scrollCalls.setBorder(new TitledBorder("Calls"));

        VerticalPanel underPanel = new VerticalPanel();
        underPanel.add("Underlying price", m_labUnderPrice);

        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.X_AXIS));
        mainPanel.add(scrollCalls);
        mainPanel.add(scrollPuts);

        setLayout(new BorderLayout());
        add(underPanel, BorderLayout.NORTH);
        add(mainPanel);

        m_timer.start();

        ApiDemo.INSTANCE.controller().reqTopMktData(OptionChainsPanel.m_underContract, "", false, m_stockListener);
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
        ApiDemo.INSTANCE.controller().cancelTopMktData(m_stockListener);
        m_putsModel.desubscribe();
        m_callsModel.desubscribe();
        m_timer.stop();
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        m_putsModel.fireTableDataChanged();
        m_callsModel.fireTableDataChanged();
    }

    @Override
    public void contractDetails(ArrayList<NewContractDetails> list) {
        for (NewContractDetails data : list) {
            NewContract contract = data.contract();

            if (contract.right() == Types.Right.Put) {
                m_putsModel.addRow(contract, OptionChainsPanel.m_snapshot.isSelected());
            } else {
                m_callsModel.addRow(contract, OptionChainsPanel.m_snapshot.isSelected());
            }
        }
        m_putsModel.sort();
        m_callsModel.sort();
    }


}
