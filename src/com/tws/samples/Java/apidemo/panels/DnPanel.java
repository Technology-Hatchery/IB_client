package com.tws.samples.Java.apidemo.panels;

import com.ib.controller.DeltaNeutralContract;
import com.ib.controller.NewContract;
import com.ib.controller.NewContractDetails;
import com.ib.controller.Types;
import com.ib.interfaces.IContractDetailsHandler;
import com.tws.samples.Java.apidemo.ApiDemo;
import com.tws.samples.Java.apidemo.util.HtmlButton;
import com.tws.samples.Java.apidemo.util.TCombo;
import com.tws.samples.Java.apidemo.util.UpperField;
import com.tws.samples.Java.apidemo.util.VerticalPanel;

import javax.swing.border.TitledBorder;
import java.util.ArrayList;

/**
 * Created by Alfred on 8/12/2014.
 */
public class DnPanel extends VerticalPanel {
    UpperField m_symbol = new UpperField();
    TCombo<Types.SecType> m_secType = new TCombo<Types.SecType>(Types.SecType.values());
    UpperField m_expiry = new UpperField();
    UpperField m_exchange = new UpperField();
    UpperField m_currency = new UpperField();
    UpperField m_delta = new UpperField();
    UpperField m_price = new UpperField();

    DnPanel() {
        HtmlButton but = new HtmlButton("Set") {
            @Override
            protected void actionPerformed() {
                onAdd();
            }
        };

        setBorder(new TitledBorder("Delta-Neutral"));
        add("Symbol", m_symbol);
        add("Sec type", m_secType);
        add("Expiry", m_expiry);
        add("Exchange", m_exchange, but);
        add("Currency", m_currency);
        add("Delta", m_delta);
        add("Price", m_price);
    }

    protected void onAdd() {
        NewContract dn = new NewContract();
        dn.symbol(m_symbol.getText().toUpperCase());
        dn.secType(m_secType.getSelectedItem());
        dn.expiry(m_expiry.getText());
        dn.exchange(m_exchange.getText().toUpperCase());
        dn.currency(m_currency.getText().toUpperCase());

        ApiDemo.INSTANCE.controller().reqContractDetails(dn, new IContractDetailsHandler() {
            @Override
            public void contractDetails(ArrayList<NewContractDetails> list) {
                if (list.size() == 1) {
                    NewContract c = list.get(0).contract();
                    SpreadsPanel.m_dnContract = new DeltaNeutralContract(c.conid(), m_delta.getDouble(), m_price.getDouble());
                    SpreadsPanel.m_dnText.setText(String.format("Delta-neutral: %s Delta: %s  Price: %s", c.description(), m_delta.getText(), m_price.getText()));
                } else {
                    ApiDemo.INSTANCE.show("DN description does not define a uniqe contract");
                    SpreadsPanel.m_dnContract = null;
                    SpreadsPanel.m_dnText.setText(null);
                }
            }
        });
    }
}
