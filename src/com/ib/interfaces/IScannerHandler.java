package com.ib.interfaces;

import com.ib.controller.NewContractDetails;

/**
 * Created by Alfred on 8/10/2014.
 */
public interface IScannerHandler {
    void scannerParameters(String xml);

    void scannerData(int rank, NewContractDetails contractDetails, String legsStr);

    void scannerDataEnd();
}


