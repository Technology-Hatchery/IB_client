package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.*;
import com.ib.interfaces.IContractDetailsHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.panels.resources.TopModel;
import com.tws.samples.Java.apidemo.panels.resources.LegModel;
import com.tws.samples.Java.apidemo.panels.resources.LegRow;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class SpreadsPanel extends JPanel {
    private final NewContract m_contract = new NewContract();
    public static TCombo<Types.Action> m_action = new TCombo<Types.Action>(Types.Action.values());
    public static UpperField m_ratio = new UpperField("1");
    private final ContractPanel m_contractPanel = new ComboContractPanel(m_contract);
    private final ArrayList<LegRow> m_legRows = new ArrayList<LegRow>();
    private final LegModel m_legsModel = new LegModel(m_legRows);
    private final JTable m_legsTable = new JTable(m_legsModel);
    private final TopModel m_mktDataModel = new TopModel();
    private final JTable m_mktDataTable = new JTable(m_mktDataModel);
    public static DeltaNeutralContract m_dnContract;
    private final DnPanel m_dnPanel = new DnPanel();
    public static JLabel m_dnText = new JLabel();

    public SpreadsPanel() {
        HtmlButton addLeg = new HtmlButton("Add Leg") {
            @Override
            protected void actionPerformed() {
                onAddLeg();
            }
        };

        HtmlButton removeLeg = new HtmlButton("Remove Selected Leg") {
            @Override
            protected void actionPerformed() {
                onRemoveLeg();
            }
        };

        HtmlButton removeLegs = new HtmlButton("Clear All Legs") {
            @Override
            protected void actionPerformed() {
                onRemoveLegs();
            }
        };

        HtmlButton mktData = new HtmlButton("Request Market Data") {
            @Override
            protected void actionPerformed() {
                onReqMktData();
            }
        };

        HtmlButton placeOrder = new HtmlButton("Place Order") {
            @Override
            protected void actionPerformed() {
                onPlaceOrder();
            }
        };

        VerticalPanel buts = new VerticalPanel();
        buts.add(addLeg);
        buts.add(removeLeg);
        buts.add(mktData);
        buts.add(placeOrder);
        buts.add(Box.createVerticalStrut(10));
        buts.add(removeLegs);

        JScrollPane legsScroll = new JScrollPane(m_legsTable);
        legsScroll.setPreferredSize(new Dimension(100, 1));
        legsScroll.setBorder(new EmptyBorder(0, 0, 0, 0));

        JPanel legsPanel = new JPanel();
        legsPanel.setBorder(new TitledBorder("Combo Legs"));
        legsPanel.setLayout(new BorderLayout());
        legsPanel.add(legsScroll);
        legsPanel.add(m_dnText, BorderLayout.SOUTH);

        VerticalPanel.HorzPanel horzPanel = new VerticalPanel.HorzPanel();
        horzPanel.setBorder(new TitledBorder("Build Combo"));
        horzPanel.add(m_contractPanel);
        horzPanel.add(buts);
        horzPanel.add(legsPanel);
        horzPanel.add(m_dnPanel);

        JScrollPane mktDataScroll = new JScrollPane(m_mktDataTable);
        mktDataScroll.setBorder(new TitledBorder("Combo Market Data"));

        setLayout(new BorderLayout());
        add(horzPanel, BorderLayout.NORTH);
        add(mktDataScroll);
    }

    protected void onAddLeg() {
        m_contractPanel.onOK();
        ApiDemo.INSTANCE.controller().reqContractDetails(m_contract, new IContractDetailsHandler() {
            @Override
            public void contractDetails(ArrayList<NewContractDetails> list) {
                for (NewContractDetails details : list) {
                    addLeg(details);
                }
            }
        });
    }

    protected void onRemoveLeg() {
        int[] indexes = m_legsTable.getSelectedRows();
        for (int i = indexes.length - 1; i >= 0; i--) {
            int index = indexes[i];
            m_legRows.remove(index);
        }
        m_legsModel.fireTableDataChanged();
    }

    protected void onRemoveLegs() {
        m_legRows.clear();
        m_legsModel.fireTableDataChanged();
    }

    protected void addLeg(NewContractDetails contractDetails) {
        NewContract c = contractDetails.contract();
        NewComboLeg leg = new NewComboLeg();
        leg.action(m_action.getSelectedItem());
        leg.ratio(m_ratio.getInt());
        leg.conid(c.conid());
        leg.exchange(c.exchange());

        LegRow row = new LegRow(c, leg);
        m_legRows.add(row);
        m_legsModel.fireTableDataChanged();
    }

    protected void onReqMktData() {
        NewContract combo = getComboContractFromLegs();
        if (combo != null) {
            m_mktDataModel.addRow(getComboContractFromLegs());
        }
    }

    private NewContract getComboContractFromLegs() {
        if (m_legRows.size() < 2) {
            return null;
        }

        LegRow leg = m_legRows.get(0);

        NewContract comboContract = new NewContract();
        comboContract.secType(Types.SecType.BAG);
        comboContract.currency(leg.m_contract.currency());
        comboContract.exchange(leg.m_contract.exchange());
        comboContract.symbol(comboContract.exchange().equals("SMART")
                ? leg.m_contract.currency()
                : leg.m_contract.symbol());

        for (LegRow row : m_legRows) {
            comboContract.comboLegs().add(row.m_leg);
        }

        if (m_dnContract != null) {
            comboContract.underComp(m_dnContract);
        }

        return comboContract;
    }

    protected void onPlaceOrder() {
        NewOrder o = new NewOrder();
        o.totalQuantity(1);

        NewContract c = getComboContractFromLegs();
        TicketDlg dlg = new TicketDlg(c, o);
        dlg.setVisible(true);
    }




}
