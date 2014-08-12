package com.tws.samples.Java.apidemo.panels;

/**
 * Created by Alfred on 8/11/2014.
 */

import com.ib.client.TagValue;
import com.ib.controller.Types;
import com.tws.samples.Java.apidemo.TicketDlg;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

/**
 * This panel edits all ComboParam values except for Non-Guaranteed.
 * That one goes on main panel because it applies to all combo orders.
 */
public class ComboTicketPanel extends VerticalPanel {
    final UpperField[] m_fields = new UpperField[Types.ComboParam.values().length];

    public ComboTicketPanel() {
        for (Types.ComboParam param : Types.ComboParam.values()) {
            if (param == Types.ComboParam.NonGuaranteed) {
                continue;
            }
            UpperField field = new UpperField();
            m_fields[param.ordinal()] = field;
            add(param.toString(), field);
            field.setText(TicketDlg.getVal(param));
        }
    }

    public void onOK() {
        for (Types.ComboParam param : Types.ComboParam.values()) {
            if (param == Types.ComboParam.NonGuaranteed) {
                continue;
            }
            UpperField field = m_fields[param.ordinal()];
            String val = field.getText();
            if (val != null && val.length() > 0) {
                TagValue tv = new TagValue(param.toString(), val);
                TicketDlg.m_order.smartComboRoutingParams().add(tv);
            }
        }
    }
}
