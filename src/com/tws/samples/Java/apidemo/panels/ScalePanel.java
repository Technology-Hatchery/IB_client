package com.tws.samples.Java.apidemo.panels;

import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class ScalePanel extends VerticalPanel {
    UpperField m_initLevelSize = new UpperField();
    UpperField m_subsLevelSize = new UpperField();
    UpperField m_priceIncrement = new UpperField();
    UpperField m_priceAdjustValue = new UpperField();
    UpperField m_priceAdjustInterval = new UpperField();
    UpperField m_profitOffset = new UpperField();
    JCheckBox m_autoReset = new JCheckBox();
    UpperField m_initPosition = new UpperField();
    UpperField m_initFillQty = new UpperField();
    JCheckBox m_randomPercent = new JCheckBox();
    UpperField m_table = new UpperField();

    public ScalePanel() {
        m_initLevelSize.setText(TicketDlg.m_order.scaleInitLevelSize());
        m_subsLevelSize.setText(TicketDlg.m_order.scaleSubsLevelSize());
        m_priceIncrement.setText(TicketDlg.m_order.scalePriceIncrement());
        m_priceAdjustValue.setText(TicketDlg.m_order.scalePriceAdjustValue());
        m_priceAdjustInterval.setText(TicketDlg.m_order.scalePriceAdjustInterval());
        m_profitOffset.setText(TicketDlg.m_order.scaleProfitOffset());
        m_autoReset.setSelected(TicketDlg.m_order.scaleAutoReset());
        m_initPosition.setText(TicketDlg.m_order.scaleInitPosition());
        m_initFillQty.setText(TicketDlg.m_order.scaleInitFillQty());
        m_randomPercent.setSelected(TicketDlg.m_order.scaleRandomPercent());
        m_table.setText(TicketDlg.m_order.scaleTable());

        add("Initial comp size", m_initLevelSize);
        add("Subsequent comp size", m_subsLevelSize);
        add("Randomize size", m_randomPercent);
        add(Box.createVerticalStrut(10));
        add("Price increment", m_priceIncrement);
        add("Profit offset", m_profitOffset);
        add("Auto-reset", m_autoReset);
        add(Box.createVerticalStrut(10));
        add("Initial position", m_initPosition);
        add("Filled init comp size", m_initFillQty);
        add(Box.createVerticalStrut(10));
        add("Increase price by", m_priceAdjustValue, new JLabel("every"), m_priceAdjustInterval, new JLabel("seconds"));
        add(Box.createVerticalStrut(10));
        add("Manual table", m_table);
    }

    public void onOK() {
        TicketDlg.m_order.scaleInitLevelSize(m_initLevelSize.getInt());
        TicketDlg.m_order.scaleSubsLevelSize(m_subsLevelSize.getInt());
        TicketDlg.m_order.scalePriceIncrement(m_priceIncrement.getDouble());
        TicketDlg.m_order.scalePriceAdjustValue(m_priceAdjustValue.getDouble());
        TicketDlg.m_order.scalePriceAdjustInterval(m_priceAdjustInterval.getInt());
        TicketDlg.m_order.scaleProfitOffset(m_profitOffset.getDouble());
        TicketDlg.m_order.scaleAutoReset(m_autoReset.isSelected());
        TicketDlg.m_order.scaleInitPosition(m_initPosition.getInt());
        TicketDlg.m_order.scaleInitFillQty(m_initFillQty.getInt());
        TicketDlg.m_order.scaleRandomPercent(m_randomPercent.isSelected());
        TicketDlg.m_order.scaleTable(m_table.getText());
    }
}
