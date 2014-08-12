package com.tws.samples.Java.apidemo.panels;

import com.ib.client.TagValue;
import com.ib.controller.OrderType;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class OrderPanel extends VerticalPanel {
    final TCombo<String> m_account = new TCombo<String>(ApiDemo.INSTANCE.accountList().toArray(new String[0]));
    final TCombo<Types.Action> m_action = new TCombo<Types.Action>(Types.Action.values());
    final UpperField m_quantity = new UpperField("100");
    final UpperField m_displaySize = new UpperField();
    final TCombo<OrderType> m_orderType = new TCombo<OrderType>(OrderType.values());
    final UpperField m_lmtPrice = new UpperField("200");
    final UpperField m_auxPrice = new UpperField();
    final TCombo<Types.TimeInForce> m_tif = new TCombo<Types.TimeInForce>(Types.TimeInForce.values());
    final JCheckBox m_nonGuaranteed = new JCheckBox();

    public OrderPanel() {
        m_orderType.removeItemAt(0); // remove None

        m_account.setSelectedItem(TicketDlg.m_order.account() != null ? TicketDlg.m_order.account() : ApiDemo.INSTANCE.accountList().get(0));
        m_action.setSelectedItem(TicketDlg.m_order.action());
        m_quantity.setText(TicketDlg.m_order.totalQuantity());
        m_displaySize.setText(TicketDlg.m_order.displaySize());
        m_orderType.setSelectedItem(TicketDlg.m_order.orderType());
        m_lmtPrice.setText(TicketDlg.m_order.lmtPrice());
        m_auxPrice.setText(TicketDlg.m_order.auxPrice());
        m_tif.setSelectedItem(TicketDlg.m_order.tif());
        m_nonGuaranteed.setSelected(TicketDlg.getVal(Types.ComboParam.NonGuaranteed).equals("1"));

        add("Account", m_account);
        add("Action", m_action);
        add("Quantity", m_quantity);
        add("Display size", m_displaySize);
        add("Order type", m_orderType);
        add("Limit price", m_lmtPrice);
        add("Aux price", m_auxPrice);
        add("Time-in-force", m_tif);
        if (TicketDlg.m_contract.isCombo()) {
            add("Non-guaranteed", m_nonGuaranteed);
        }
    }

    public void onOK() {
        TicketDlg.m_order.account(m_account.getText().toUpperCase());
        TicketDlg.m_order.action(m_action.getSelectedItem());
        TicketDlg.m_order.totalQuantity(m_quantity.getInt());
        TicketDlg.m_order.displaySize(m_displaySize.getInt());
        TicketDlg.m_order.orderType(m_orderType.getSelectedItem());
        TicketDlg.m_order.lmtPrice(m_lmtPrice.getDouble());
        TicketDlg.m_order.auxPrice(m_auxPrice.getDouble());
        TicketDlg.m_order.tif(m_tif.getSelectedItem());
        if (TicketDlg.m_contract.isCombo()) {
            TagValue tv = new TagValue(Types.ComboParam.NonGuaranteed.toString(), m_nonGuaranteed.isSelected() ? "1" : "0");
            TicketDlg.m_order.smartComboRoutingParams().add(tv);
        }
    }
}
