package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.OrderType;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class VolatilityTicketPanel extends VerticalPanel {
    final UpperField m_volatility = new UpperField();
    final TCombo<Types.VolatilityType> m_volatilityType = new TCombo<Types.VolatilityType>(Types.VolatilityType.values());
    final JCheckBox m_continuousUpdate = new JCheckBox();
    final TCombo<Types.ReferencePriceType> m_referencePriceType = new TCombo<Types.ReferencePriceType>(Types.ReferencePriceType.values());
    final TCombo<OrderType> m_deltaNeutralOrderType = new TCombo<OrderType>(OrderType.values());
    final UpperField m_deltaNeutralAuxPrice = new UpperField();
    final UpperField m_deltaNeutralConId = new UpperField();
    final UpperField m_upper = new UpperField();
    final UpperField m_lower = new UpperField();

    public VolatilityTicketPanel() {
        add("Volatility", m_volatility, m_volatilityType);
        add("Continuously update price", m_continuousUpdate);
        add("Option reference price", m_referencePriceType);
        add("Hedge order type", m_deltaNeutralOrderType);
        add("Hedge order aux price", m_deltaNeutralAuxPrice);
        add("Hedge contract conid", m_deltaNeutralConId);
        add("Stock range - upper", m_upper);
        add("Stock range - lower", m_lower);

        m_volatility.setText(TicketDlg.m_order.volatility());
        m_volatilityType.setSelectedItem(TicketDlg.m_order.volatilityType());
        m_continuousUpdate.setSelected(TicketDlg.m_order.continuousUpdate());
        m_referencePriceType.setSelectedItem(TicketDlg.m_order.referencePriceType());
        m_deltaNeutralOrderType.setSelectedItem(TicketDlg.m_order.deltaNeutralOrderType());
        m_deltaNeutralAuxPrice.setText(TicketDlg.m_order.deltaNeutralAuxPrice());
        m_deltaNeutralConId.setText(TicketDlg.m_order.deltaNeutralConId());
        m_upper.setText(TicketDlg.m_order.stockRangeUpper());
        m_lower.setText(TicketDlg.m_order.stockRangeLower());
    }

    public void onOK() {
        TicketDlg.m_order.volatility(m_volatility.getDouble());
        TicketDlg.m_order.volatilityType(m_volatilityType.getSelectedItem());
        TicketDlg.m_order.continuousUpdate(m_continuousUpdate.isSelected());
        TicketDlg.m_order.referencePriceType(m_referencePriceType.getSelectedItem());
        TicketDlg.m_order.deltaNeutralOrderType(m_deltaNeutralOrderType.getSelectedItem());
        TicketDlg.m_order.deltaNeutralAuxPrice(m_deltaNeutralAuxPrice.getDouble());
        TicketDlg.m_order.deltaNeutralConId(m_deltaNeutralConId.getInt());
        TicketDlg.m_order.stockRangeUpper(m_upper.getDouble());
        TicketDlg.m_order.stockRangeLower(m_lower.getDouble());
    }
}
