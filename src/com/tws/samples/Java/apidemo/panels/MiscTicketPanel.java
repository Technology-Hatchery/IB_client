package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.*;

/**
 * Created by Alfred on 8/11/2014.
 */
public class MiscTicketPanel extends VerticalPanel.StackPanel {
    final UpperField m_goodAfter = new UpperField();
    final UpperField m_goodTil = new UpperField();
    final JTextField m_orderRef = new JTextField(7);
    final JTextField m_ocaGroup = new JTextField(7);
    final UpperField m_minQty = new UpperField();
    final UpperField m_percentOffset = new UpperField();
    final UpperField m_trailingStopPrice = new UpperField();
    final UpperField m_trailingPercent = new UpperField();
    final UpperField m_discretionaryAmt = new UpperField();
    final UpperField m_nbboPriceCap = new UpperField();

    final TCombo<Types.OcaType> m_ocaType = new TCombo<Types.OcaType>(Types.OcaType.values());
    final TCombo<Types.Rule80A> m_rule80A = new TCombo<Types.Rule80A>(Types.Rule80A.values());
    final TCombo<Types.TriggerMethod> m_trigger = new TCombo<Types.TriggerMethod>(Types.TriggerMethod.values());

    final TCombo<Types.HedgeType> m_hedgeType = new TCombo<Types.HedgeType>(Types.HedgeType.values());
    final UpperField m_hedgeParam = new UpperField();

    final JCheckBox m_blockOrder = new JCheckBox();
    final JCheckBox m_sweepToFill = new JCheckBox();
    final JCheckBox m_hidden = new JCheckBox();
    final JCheckBox m_outsideRth = new JCheckBox();
    final JCheckBox m_allOrNone = new JCheckBox();
    final JCheckBox m_overrideConstraints = new JCheckBox();
    final JCheckBox m_notHeld = new JCheckBox();
    final JCheckBox m_transmit = new JCheckBox();
    final JCheckBox m_eTradeOnly = new JCheckBox();
    final JCheckBox m_firmQuoteOnly = new JCheckBox();
    final JCheckBox m_optOutSmartRouting = new JCheckBox();


    public MiscTicketPanel() {
        VerticalPanel top = new VerticalPanel();
        top.add("Order ref", m_orderRef);
        top.add("Min Qty", m_minQty);
        top.add("Good after", m_goodAfter);
        top.add("Good until", m_goodTil);
        top.add("Rule 80A", m_rule80A);
        top.add("Trigger method", m_trigger);
        top.add("Percent Offset", m_percentOffset);
        top.add("Trail order stop price", m_trailingStopPrice);
        top.add("Trailing percent", m_trailingPercent);
        top.add("Discretionary amount", m_discretionaryAmt);
        top.add("NBBO price cap", m_nbboPriceCap);

        top.add("OCA group and type", m_ocaGroup, m_ocaType);
        //add( "OCA type", m_ocaType);

        top.add("Hedge type and param", m_hedgeType, m_hedgeParam);
        //add( "Hedge param", m_hedgeParam);


        VerticalPanel left = new VerticalPanel();
        left.add("Not held", m_notHeld);
        left.add("Block order", m_blockOrder);
        left.add("Sweep-to-fill", m_sweepToFill);
        left.add("Hidden", m_hidden);
        left.add("Fill outside RTH", m_outsideRth);
        left.add("All-or-none", m_allOrNone);

        VerticalPanel right = new VerticalPanel();
        right.add("Override constraints", m_overrideConstraints);
        right.add("E-trade only", m_eTradeOnly);
        right.add("Firm quote only", m_firmQuoteOnly);
        right.add("Opt out SMART routing", m_optOutSmartRouting);
        right.add("Transmit", m_transmit);

        VerticalPanel.HorzPanel checks = new VerticalPanel.HorzPanel();
        checks.add(left);
        checks.add(Box.createHorizontalGlue());
        checks.add(right);
        checks.add(Box.createHorizontalGlue());

        add(top);
        add(Box.createVerticalStrut(20));
        add(checks);

        m_minQty.setText(TicketDlg.m_order.minQty());
        m_goodAfter.setText(TicketDlg.m_order.goodAfterTime());
        m_goodTil.setText(TicketDlg.m_order.goodTillDate());
        m_orderRef.setText(TicketDlg.m_order.orderRef());
        m_ocaGroup.setText(TicketDlg.m_order.ocaGroup());
        m_ocaType.setSelectedItem(TicketDlg.m_order.ocaType());
        m_rule80A.setSelectedItem(TicketDlg.m_order.rule80A());
        m_trigger.setSelectedItem(TicketDlg.m_order.triggerMethod());
        m_blockOrder.setSelected(TicketDlg.m_order.blockOrder());
        m_sweepToFill.setSelected(TicketDlg.m_order.sweepToFill());
        m_hidden.setSelected(TicketDlg.m_order.hidden());
        m_outsideRth.setSelected(TicketDlg.m_order.outsideRth());
        m_allOrNone.setSelected(TicketDlg.m_order.allOrNone());
        m_overrideConstraints.setSelected(TicketDlg.m_order.overridePercentageConstraints());
        m_hedgeType.setSelectedItem(TicketDlg.m_order.hedgeType());
        m_hedgeParam.setText(TicketDlg.m_order.hedgeParam());
        m_notHeld.setSelected(TicketDlg.m_order.notHeld());
        m_percentOffset.setText(TicketDlg.m_order.percentOffset());
        m_trailingStopPrice.setText(TicketDlg.m_order.trailStopPrice());
        m_trailingPercent.setText(TicketDlg.m_order.trailingPercent());
        m_discretionaryAmt.setText(TicketDlg.m_order.discretionaryAmt());
        m_eTradeOnly.setSelected(TicketDlg.m_order.eTradeOnly());
        m_firmQuoteOnly.setSelected(TicketDlg.m_order.firmQuoteOnly());
        m_nbboPriceCap.setText(TicketDlg.m_order.nbboPriceCap());
        m_optOutSmartRouting.setSelected(TicketDlg.m_order.optOutSmartRouting());
        m_transmit.setSelected(true);
    }

    public void onOK() {
        TicketDlg.m_order.minQty(m_minQty.getInt());
        TicketDlg.m_order.goodAfterTime(m_goodAfter.getText());
        TicketDlg.m_order.goodTillDate(m_goodTil.getText());
        TicketDlg.m_order.orderRef(m_orderRef.getText());
        TicketDlg.m_order.ocaGroup(m_ocaGroup.getText());
        TicketDlg.m_order.ocaType(m_ocaType.getSelectedItem());
        TicketDlg.m_order.rule80A(m_rule80A.getSelectedItem());
        TicketDlg.m_order.triggerMethod(m_trigger.getSelectedItem());
        TicketDlg.m_order.sweepToFill(m_sweepToFill.isSelected());
        TicketDlg.m_order.hidden(m_hidden.isSelected());
        TicketDlg.m_order.outsideRth(m_outsideRth.isSelected());
        TicketDlg.m_order.allOrNone(m_allOrNone.isSelected());
        TicketDlg.m_order.overridePercentageConstraints(m_overrideConstraints.isSelected());
        TicketDlg.m_order.hedgeType(m_hedgeType.getSelectedItem());
        TicketDlg.m_order.hedgeParam(m_hedgeParam.getText());
        TicketDlg.m_order.notHeld(m_notHeld.isSelected());
        TicketDlg.m_order.percentOffset(m_percentOffset.getDouble());
        TicketDlg.m_order.trailStopPrice(m_trailingStopPrice.getDouble());
        TicketDlg.m_order.trailingPercent(m_trailingPercent.getDouble());
        TicketDlg.m_order.discretionaryAmt(m_discretionaryAmt.getDouble());
        TicketDlg.m_order.eTradeOnly(m_eTradeOnly.isSelected());
        TicketDlg.m_order.firmQuoteOnly(m_firmQuoteOnly.isSelected());
        TicketDlg.m_order.nbboPriceCap(m_nbboPriceCap.getDouble());
        TicketDlg.m_order.optOutSmartRouting(m_optOutSmartRouting.isSelected());
        TicketDlg.m_order.transmit(m_transmit.isSelected());
    }
}
