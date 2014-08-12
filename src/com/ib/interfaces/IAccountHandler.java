package com.ib.interfaces;

import com.ib.controller.Position;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IAccountHandler {
    public void accountValue(String account, String key, String value, String currency);

    public void accountTime(String timeStamp);

    public void accountDownloadEnd(String account);

    public void updatePortfolio(Position position);
}

