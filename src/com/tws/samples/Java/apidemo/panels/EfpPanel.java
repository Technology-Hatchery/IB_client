package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.*;
import com.ib.controller.Types.Action;
import com.ib.interfaces.IContractDetailsHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.panels.resources.LegModel;
import com.tws.samples.Java.apidemo.panels.resources.LegRow;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/11/2014.
 */
public class EfpPanel extends JPanel {
    private final UpperField m_symbol = new UpperField("IBM");
    private final UpperField m_futExch = new UpperField("ONE");
    private final UpperField m_expiry = new UpperField("201309");
    private final UpperField m_stkExch = new UpperField("SMART");
    private final ArrayList<LegRow> m_legRows = new ArrayList<LegRow>();
    private final LegModel m_legsModel = new LegModel(m_legRows);
    private final JTable m_legsTable = new JTable(m_legsModel);
    private final EfpModel m_efpModel = new EfpModel();
    private final JCheckBox m_divProt = new JCheckBox();

    public EfpPanel() {
        HtmlButton addLeg = new HtmlButton("Create EFP") {
            @Override
            protected void actionPerformed() {
                onCreateEfp();
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

        VerticalPanel params = new VerticalPanel();
        params.add("Symbol", m_symbol);
        params.add("Futures exchange", m_futExch);
        params.add("Expiry", m_expiry);
        params.add("Stock exchange", m_stkExch);
        params.add("Dividend protected", m_divProt);

        VerticalPanel buts = new VerticalPanel();
        buts.add(addLeg);
        buts.add(mktData);
        buts.add(placeOrder);

        JScrollPane legsScroll = new JScrollPane(m_legsTable);
        legsScroll.setPreferredSize(new Dimension(100, 1));
        legsScroll.setBorder(new TitledBorder("Combo Legs"));

        VerticalPanel.HorzPanel horzPanel = new VerticalPanel.HorzPanel();
        horzPanel.setBorder(new TitledBorder("Build Combo"));
        horzPanel.add(params);
        horzPanel.add(buts);
        horzPanel.add(legsScroll);

        JTable efpTable = new JTable(m_efpModel);
        JScrollPane efpScroll = new JScrollPane(efpTable);
        efpScroll.setBorder(new TitledBorder("EFP Market Data"));

        setLayout(new BorderLayout());
        add(horzPanel, BorderLayout.NORTH);
        add(efpScroll);
    }

    protected void onCreateEfp() {
        m_legRows.clear();
        m_legsModel.fireTableDataChanged();

        NewContract fut = new NewContract();
        fut.symbol(m_symbol.getText());
        fut.secType(Types.SecType.FUT);
        fut.exchange(m_futExch.getText());
        fut.expiry(m_expiry.getText());
        fut.currency("USD");

        ApiDemo.INSTANCE.controller().reqContractDetails(fut, new IContractDetailsHandler() {
            @Override
            public void contractDetails(ArrayList<NewContractDetails> list) {
                // if two futures are returned, assume that the first is is no div prot and the
                // second one is div prot; unfortunately TWS does not send down the div prot flag
                if (list.size() == 2) {
                    int i = m_divProt.isSelected() ? 1 : 0;
                    addFutLeg(list.get(i));
                } else if (list.size() != 1) {
                    ApiDemo.INSTANCE.show("Request does not define a valid unique futures contract");
                } else {
                    addFutLeg(list.get(0));
                }
            }

            void addFutLeg(NewContractDetails details) {
                addLeg(details.contract(), Action.BUY, 1);
            }

            ;
        });

        NewContract stk = new NewContract();
        stk.symbol(m_symbol.getText());
        stk.secType(Types.SecType.STK);
        stk.exchange(m_stkExch.getText());
        stk.currency("USD");

        ApiDemo.INSTANCE.controller().reqContractDetails(stk, new IContractDetailsHandler() {
            @Override
            public void contractDetails(ArrayList<NewContractDetails> list) {
                for (NewContractDetails data : list) {
                    addLeg(data.contract(), Action.SELL, 100);
                }
            }
        });
    }

    protected void addLeg(NewContract contract, Action action, int ratio) {
        NewComboLeg leg = new NewComboLeg();
        leg.action(action);
        leg.ratio(ratio);
        leg.conid(contract.conid());
        leg.exchange(contract.exchange());

        LegRow row = new LegRow(contract, leg);
        m_legRows.add(row);
        m_legsModel.fireTableDataChanged();
    }

    protected void onRemoveLeg() {
        int i = m_legsTable.getSelectedRow();
        if (i != -1) {
            m_legRows.remove(i);
            m_legsModel.fireTableDataChanged();
        }
    }

    protected void onReqMktData() {
        m_efpModel.addRow(getComboContractFromLegs());
    }

    private NewContract getComboContractFromLegs() {
        if (m_legRows.size() < 2) {
            return null;
        }

        LegRow leg = m_legRows.get(0);

        NewContract comboContract = new NewContract();
        comboContract.secType(Types.SecType.BAG);
        comboContract.currency(leg.m_contract.currency());
        comboContract.exchange("SMART");
        comboContract.symbol("USD");

        for (LegRow row : m_legRows) {
            comboContract.comboLegs().add(row.m_leg);
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
