package com.ib.interfaces;

import java.util.ArrayList;


public interface IConnectionHandler {
    void connected();

    void disconnected();

    void accountList(ArrayList<String> list);

    void error(Exception e);

    void message(int id, int errorCode, String errorMsg);

    void show(String string);
}