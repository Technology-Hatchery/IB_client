VERSION 1.0 CLASS

BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Utils"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

Option Explicit

' Enums
Public Enum tickType
    BID_SIZE = 0
    BID_PRICE
    ASK_PRICE
    ASK_SIZE
    LAST_PRICE
    LAST_SIZE
    HIGH_TICK
    LOW_TICK
    VOLUME_TICK
    CLOSE_PRICE
    BID_OPTION_COMPUTATION
    ASK_OPTION_COMPUTATION
    LAST_OPTION_COMPUTATION
    MODEL_OPTION
    OPEN_TICK
    LOW_13_WEEK
    HIGH_13_WEEK
    LOW_26_WEEK
    HIGH_26_WEEK
    LOW_52_WEEK
    HIGH_52_WEEK
    AVG_VOLUME
    OPEN_INTEREST
    OPTION_HISTORICAL_VOL
    OPTION_IMPLIED_VOL
    OPTION_BID_EXCH
    OPTION_ASK_EXCH
    OPTION_CALL_OPEN_INTEREST
    OPTION_PUT_OPEN_INTEREST
    OPTION_CALL_VOLUME
    OPTION_PUT_VOLUME
    INDEX_FUTURE_PREMIUM
    BID_EXCH
    ASK_EXCH
    AUCTION_VOLUME
    AUCTION_PRICE
    AUCTION_IMBALANCE
    MARK_PRICE
    BID_EFP_COMPUTATION
    ASK_EFP_COMPUTATION
    LAST_EFP_COMPUTATION
    OPEN_EFP_COMPUTATION
    HIGH_EFP_COMPUTATION
    LOW_EFP_COMPUTATION
    CLOSE_EFP_COMPUTATION
    LAST_TIMESTAMP
    SHORTABLE
    FUNDAMENTAL_RATIOS
    RT_VOLUME
    HALTED
    BID_YIELD
    ASK_YIELD
    LAST_YIELD
    CUST_OPTION_COMPUTATION
    TRADE_COUNT
    TRADE_RATE
    VOLUME_RATE
    LAST_RTH_TRADE
End Enum

Public Enum List_Types
    MKT_DATA = 0
    SERVER_RESPONSES
    ERRORS
    ACCOUNT_DATA
    PORTFOLIO_DATA
End Enum

Public Enum FA_Message_Type
    GROUPS = 1
    PROFILES = 2
    ALIASES = 3
End Enum

' Win32 API functions
Private Declare Function SendMessageByNum Lib "user32" _
    Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, _
    ByVal wParam As Long, ByVal lParam As Long) As Long
    
' Constants
Private Const LB_SETHORZEXTENT = &H194

Private m_dlgMainWnd As Form
Private m_dlgAcctData As Form

'================================================================================
' Public Helper Routines
'================================================================================
Public Sub init(ByVal dlgMainWnd As Form, ByVal dlgAcctData As Form)
    Set m_dlgMainWnd = dlgMainWnd
    Set m_dlgAcctData = dlgAcctData
End Sub
Public Function faMsgTypeName(ByVal faMsgType As FA_Message_Type)
    Select Case faMsgType
        Case GROUPS:
            faMsgTypeName = "GROUPS"
        Case PROFILES:
            faMsgTypeName = "PROFILES"
        Case ALIASES:
            faMsgTypeName = "ALIASES"
    End Select
End Function
'--------------------------------------------------------------------------------
' Display an XML message
'--------------------------------------------------------------------------------
Public Sub displayMultiline(listType As List_Types, ByRef xml As String)
    Dim TABSTR, LFSTR, CRSTR, CRLFSTR, FOUR_SPACES, text As String, strArray() As String, ctr
    TABSTR = Chr$(9)
    LFSTR = Chr$(10)
    CRSTR = Chr$(13)
    CRLFSTR = CRSTR & LFSTR
    FOUR_SPACES = "    "
    text = Replace(xml, TABSTR, FOUR_SPACES)
    strArray = Split(text, CRLFSTR)
    For ctr = 0 To UBound(strArray)
        Dim line As String
        line = strArray(ctr)
        If Len(line) > 1020 Then
            line = Left(line, 1020) & " ..."
        End If
        Call addListItem(listType, line)
    Next
End Sub

'--------------------------------------------------------------------------------
' Add an item to one of the display listboxes
'--------------------------------------------------------------------------------
Public Sub addListItem(listType As List_Types, data As String)
    Static m_lstMktDataWidth As Long
    Static m_lstServerResponsesWidth As Long
    Static m_lstErrorsWidth As Long
    Static m_lstAcctValueWidth As Long
    Static m_lstPortfolioWidth As Long
    
    Select Case listType
        Case MKT_DATA:
            checkListWidth m_dlgMainWnd.lstMktData, m_lstMktDataWidth, data
        Case SERVER_RESPONSES:
            checkListWidth m_dlgMainWnd.lstServerResponses, m_lstServerResponsesWidth, data
        Case ERRORS:
            checkListWidth m_dlgMainWnd.lstErrors, m_lstErrorsWidth, data
        Case ACCOUNT_DATA:
            checkListWidth m_dlgAcctData.lstKeyValueData, m_lstAcctValueWidth, data
        Case PORTFOLIO_DATA:
            checkListWidth m_dlgAcctData.lstPortfolioData, m_lstPortfolioWidth, data
        Case Else:
            Return
    End Select
End Sub

'--------------------------------------------------------------------------------
' Adds a horizontal scrollbar to a display listbox if required
'--------------------------------------------------------------------------------
Public Sub checkListWidth(displayLst As ListBox, ByVal minRequiredWidth As Long, data As String)
    If minRequiredWidth < m_dlgMainWnd.TextWidth(data & "  ") Then
        minRequiredWidth = m_dlgMainWnd.TextWidth(data & "  ")
        ' If using Twips then change to pixels before reseting the listbox
        If m_dlgMainWnd.ScaleMode = vbTwips Then
            minRequiredWidth = minRequiredWidth / Screen.TwipsPerPixelX
        End If
        
        SendMessageByNum displayLst.hwnd, LB_SETHORZEXTENT, minRequiredWidth, 0
    End If

    ' ListBox can hold up to 32767 elements
    ' then ListBox.ListCount overflows
    If displayLst.ListCount >= 32767 Then
        displayLst.RemoveItem (0)
    End If
    
    ' finally set the text
    displayLst.AddItem data

End Sub

'--------------------------------------------------------------------------------
' Returns the tick display string used when adding tick data to the display list.
'--------------------------------------------------------------------------------
Public Function getField(field As tickType)
    Select Case field
        Case tickType.BID_SIZE:                 getField = "bidSize"
        Case tickType.BID_PRICE:                getField = "bidPrice"
        Case tickType.ASK_PRICE:                getField = "askPrice"
        Case tickType.ASK_SIZE:                 getField = "askSize"
        Case tickType.LAST_PRICE:               getField = "lastPrice"
        Case tickType.LAST_SIZE:                getField = "lastSize"
        Case tickType.HIGH_TICK:                getField = "high"
        Case tickType.LOW_TICK:                 getField = "low"
        Case tickType.VOLUME_TICK:              getField = "volume"
        Case tickType.CLOSE_PRICE:              getField = "close"
        Case tickType.BID_OPTION_COMPUTATION:   getField = "bidOptComp"
        Case tickType.ASK_OPTION_COMPUTATION:   getField = "askOptComp"
        Case tickType.LAST_OPTION_COMPUTATION:  getField = "lastOptComp"
        Case tickType.MODEL_OPTION:             getField = "modelOption"
        Case tickType.OPEN_TICK:                getField = "open"
        Case tickType.LOW_13_WEEK:              getField = "13WeekLow"
        Case tickType.HIGH_13_WEEK:             getField = "13WeekHigh"
        Case tickType.LOW_26_WEEK:              getField = "26WeekLow"
        Case tickType.HIGH_26_WEEK:             getField = "26WeekHigh"
        Case tickType.LOW_52_WEEK:              getField = "52WeekLow"
        Case tickType.HIGH_52_WEEK:             getField = "52WeekHigh"
        Case tickType.AVG_VOLUME:               getField = "AvgVolume"
        Case tickType.OPEN_INTEREST:            getField = "OpenInterest"
        Case tickType.OPTION_HISTORICAL_VOL:    getField = "OptionHistoricalVolatility"
        Case tickType.OPTION_IMPLIED_VOL:       getField = "OptionImpliedVolatility"
        Case tickType.OPTION_BID_EXCH:          getField = "OptionBidExchStr"
        Case tickType.OPTION_ASK_EXCH:          getField = "OptionAskExchStr"
        Case tickType.OPTION_CALL_OPEN_INTEREST: getField = "OptionCallOpenInterest"
        Case tickType.OPTION_PUT_OPEN_INTEREST:  getField = "OptionPutOpenInterest"
        Case tickType.OPTION_CALL_VOLUME:       getField = "OptionCallVolume"
        Case tickType.OPTION_PUT_VOLUME:        getField = "OptionPutVolume"
        Case tickType.INDEX_FUTURE_PREMIUM:     getField = "IndexFuturePremium"
        Case tickType.BID_EXCH:                 getField = "bidExch"
        Case tickType.ASK_EXCH:                 getField = "askExch"
        Case tickType.AUCTION_VOLUME:           getField = "auctionVolume"
        Case tickType.AUCTION_PRICE:            getField = "auctionPrice"
        Case tickType.AUCTION_IMBALANCE:        getField = "auctionImbalance"
        Case tickType.MARK_PRICE:               getField = "markPrice"
        Case tickType.BID_EFP_COMPUTATION:      getField = "bidEFP"
        Case tickType.ASK_EFP_COMPUTATION:      getField = "askEFP"
        Case tickType.LAST_EFP_COMPUTATION:     getField = "lastEFP"
        Case tickType.OPEN_EFP_COMPUTATION:     getField = "openEFP"
        Case tickType.HIGH_EFP_COMPUTATION:     getField = "highEFP"
        Case tickType.LOW_EFP_COMPUTATION:      getField = "lowEFP"
        Case tickType.CLOSE_EFP_COMPUTATION:    getField = "closeEFP"
        Case tickType.LAST_TIMESTAMP:           getField = "lastTimestamp"
        Case tickType.SHORTABLE:                getField = "shortable"
        Case tickType.FUNDAMENTAL_RATIOS:       getField = "fundamentals"
        Case tickType.RT_VOLUME:                getField = "RTVolume"
        Case tickType.HALTED:                   getField = "halted"
        Case tickType.BID_YIELD:                getField = "bidYield"
        Case tickType.ASK_YIELD:                getField = "askYield"
        Case tickType.LAST_YIELD:               getField = "lastYield"
        Case tickType.CUST_OPTION_COMPUTATION:  getField = "custOptComp"
        Case tickType.TRADE_COUNT:              getField = "trades"
        Case tickType.TRADE_RATE:               getField = "trades/min"
        Case tickType.VOLUME_RATE:              getField = "volume/min"
        Case tickType.LAST_RTH_TRADE:           getField = "lastRTHTrade"
        Case Else:                              getField = "unknown"
    End Select
End Function
