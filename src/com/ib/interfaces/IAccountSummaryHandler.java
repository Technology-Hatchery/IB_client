package com.ib.interfaces;

import com.ib.controller.AccountSummaryTag;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IAccountSummaryHandler {
    void accountSummary(String account, AccountSummaryTag tag, String value, String currency);

    void accountSummaryEnd();
}


