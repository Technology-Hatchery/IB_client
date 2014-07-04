' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Object = "{0A77CCF5-052C-11D6-B0EC-00B0D074179C}#1.0#0"; "Tws.ocx"
Begin VB.Form dlgMainWnd 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "VB 6.0 Sample using TWS ActiveX Control"
   ClientHeight    =   13335
   ClientLeft      =   5220
   ClientTop       =   2895
   ClientWidth     =   10200
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   13335
   ScaleWidth      =   10200
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancelAccountSummary 
      Caption         =   "Cancel Acct Summary"
      Height          =   335
      Left            =   8160
      TabIndex        =   37
      Top             =   12720
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqAccountSummary 
      Caption         =   "Req Acct Summary"
      Height          =   335
      Left            =   8160
      TabIndex        =   36
      Top             =   12360
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelPositions 
      Caption         =   "Cancel Positions"
      Height          =   335
      Left            =   8160
      TabIndex        =   35
      Top             =   12000
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqPositions 
      Caption         =   "Request Positions"
      Height          =   335
      Left            =   8160
      TabIndex        =   34
      Top             =   11640
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqMarketDataType
      Caption         =   "Req Mkt Data Type..."
      Height          =   335
      Left            =   8160
      TabIndex        =   33
      Top             =   11280
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelCalculateOptionPrice
      Caption         =   "Cancel Calc Opt Price..."
      Height          =   335
      Left            =   8160
      TabIndex        =   15
      Top             =   4800
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelCalculateImpliedVolatility
      Caption         =   "Cancel Calc Impl Vol..."
      Height          =   335
      Left            =   8160
      TabIndex        =   13
      Top             =   4080
      Width           =   1935
   End
   Begin VB.CommandButton cmdCalculateOptionPrice
      Caption         =   "Calc Option Price..."
      Height          =   335
      Left            =   8160
      TabIndex        =   14
      Top             =   4440
      Width           =   1935
   End
   Begin VB.CommandButton cmdWhatIf 
      Caption         =   "What If..."
      Height          =   335
      Left            =   8160
      TabIndex        =   16
      Top             =   5160
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqCurrentTime 
      Caption         =   "Current Time"
      Height          =   335
      Left            =   8160
      TabIndex        =   10
      Top             =   3000
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelRealTimeBars 
      Caption         =   "Canc Real Time Bars"
      Height          =   335
      Left            =   8160
      TabIndex        =   9
      Top             =   2640
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqRealTimeBars 
      Caption         =   "Real Time Bars"
      Height          =   335
      Left            =   8160
      TabIndex        =   8
      Top             =   2280
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelHistData 
      Caption         =   "Cancel Hist. Data..."
      Height          =   335
      Left            =   8160
      TabIndex        =   7
      Top             =   1920
      Width           =   1935
   End
   Begin VB.CommandButton cmdScanner 
      Caption         =   "Market Scanner..."
      Height          =   335
      Left            =   8160
      TabIndex        =   11
      Top             =   3360
      Width           =   1935
   End
   Begin VB.CommandButton cmdCalculateImpliedVolatility 
      Caption         =   "Calc Implied Volatility..."
      Height          =   335
      Left            =   8160
      TabIndex        =   12
      Top             =   3720
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqIds 
      Caption         =   "Req Next Id..."
      Height          =   335
      Left            =   8160
      TabIndex        =   27
      Top             =   9120
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqExecutions 
      Caption         =   "Req Executions..."
      Height          =   335
      Left            =   8160
      TabIndex        =   26
      Top             =   8760
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqAcctData 
      Caption         =   "Req Acct Data..."
      Height          =   335
      Left            =   8160
      TabIndex        =   25
      Top             =   8400
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqNews 
      Caption         =   "Req News Bulletins..."
      Height          =   335
      Left            =   8160
      TabIndex        =   28
      Top             =   9480
      Width           =   1935
   End
   Begin VB.CommandButton cmdServerLogLevel 
      Caption         =   "Log Configuration..."
      Height          =   335
      Left            =   8160
      TabIndex        =   29
      Top             =   9840
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqAccts 
      Caption         =   "Req Accounts"
      Height          =   335
      Left            =   8160
      TabIndex        =   30
      Top             =   10200
      Width           =   1935
   End
   Begin VB.CommandButton cmdFinancialAdvisor 
      Caption         =   "Financial Advisor"
      Height          =   335
      Left            =   8160
      TabIndex        =   31
      Top             =   10560
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqGlobalCancel 
      Caption         =   "Global Cancel"
      Height          =   335
      Left            =   8160
      TabIndex        =   32
      Top             =   10920
      Width           =   1935
   End
   Begin VB.CommandButton cmdExerciseOptions 
      Caption         =   "Exercise Options..."
      Height          =   335
      Left            =   8160
      TabIndex        =   19
      Top             =   6240
      Width           =   1935
   End
   Begin TWSLib.Tws Tws1 
      Height          =   375
      Left            =   480
      TabIndex        =   46
      Top             =   12885
      Width           =   2175
      _Version        =   65536
      _ExtentX        =   3836
      _ExtentY        =   661
      _StockProps     =   0
   End
   Begin VB.CommandButton cmdReqHistoricalData 
      Caption         =   "Historical Data..."
      Height          =   335
      Left            =   8160
      TabIndex        =   6
      Top             =   1560
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqAllOpenOrders 
      Caption         =   "Req All Open Orders"
      Height          =   335
      Left            =   8160
      TabIndex        =   23
      Top             =   7680
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqAutoOpenOrders 
      Caption         =   "Req Auto Open Orders"
      Height          =   335
      Left            =   8160
      TabIndex        =   24
      Top             =   8040
      Width           =   1935
   End
   Begin VB.CommandButton cmdClearForm 
      Caption         =   "Clear"
      Height          =   375
      Left            =   3435
      TabIndex        =   38
      Top             =   12885
      Width           =   1335
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   375
      Left            =   4995
      TabIndex        =   39
      Top             =   12885
      Width           =   1335
   End
   Begin VB.CommandButton cmdDisconnect 
      Caption         =   "Disconnect"
      Height          =   375
      Left            =   4800
      TabIndex        =   1
      Top             =   40
      Width           =   1695
   End
   Begin VB.CommandButton cmdReqMktData 
      Caption         =   "Req Mkt Data..."
      Height          =   335
      Left            =   8160
      TabIndex        =   2
      Top             =   120
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelMktData 
      Caption         =   "Cancel Mkt Data..."
      Height          =   335
      Left            =   8160
      TabIndex        =   3
      Top             =   480
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqMktDepth 
      Caption         =   "Req Mkt Depth..."
      Height          =   335
      Left            =   8160
      TabIndex        =   4
      Top             =   840
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelMktDepth 
      Caption         =   "Cancel Mkt Depth..."
      Height          =   335
      Left            =   8160
      TabIndex        =   5
      Top             =   1200
      Width           =   1935
   End
   Begin VB.CommandButton cmdPlaceOrder 
      Caption         =   "Place Order..."
      Height          =   335
      Left            =   8160
      TabIndex        =   17
      Top             =   5520
      Width           =   1935
   End
   Begin VB.CommandButton cmdCancelOrder 
      Caption         =   "Cancel Order..."
      Height          =   335
      Left            =   8160
      TabIndex        =   18
      Top             =   5880
      Width           =   1935
   End
   Begin VB.CommandButton cmdExtendedOrderAtribs 
      Caption         =   "Extended..."
      Height          =   335
      Left            =   8160
      TabIndex        =   20
      Top             =   6600
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqContractData 
      Caption         =   "Req Contract Data..."
      Height          =   335
      Left            =   8160
      TabIndex        =   21
      Top             =   6960
      Width           =   1935
   End
   Begin VB.CommandButton cmdReqOpenOrders 
      Caption         =   "Req Open Orders"
      Height          =   335
      Left            =   8160
      TabIndex        =   22
      Top             =   7320
      Width           =   1935
   End
   Begin VB.CommandButton cmdConnect 
      Caption         =   "Connect..."
      Height          =   375
      Left            =   3000
      TabIndex        =   0
      Top             =   40
      Width           =   1695
   End
   Begin VB.ListBox lstErrors 
      Height          =   3765
      Left            =   120
      TabIndex        =   45
      Top             =   8400
      Width           =   7935
   End
   Begin VB.ListBox lstServerResponses 
      Height          =   3570
      Left            =   120
      TabIndex        =   43
      Top             =   4320
      Width           =   7935
   End
   Begin VB.ListBox lstMktData 
      Height          =   3375
      Left            =   120
      TabIndex        =   41
      Top             =   450
      Width           =   7935
   End
   Begin VB.Label Label3 
      Caption         =   "Errors and Messages"
      Height          =   255
      Left            =   120
      TabIndex        =   44
      Top             =   8040
      Width           =   1575
   End
   Begin VB.Label Label2 
      Caption         =   "TWS Server Responses"
      Height          =   255
      Left            =   120
      TabIndex        =   42
      Top             =   3960
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Market and Historical Data"
      Height          =   255
      Left            =   120
      TabIndex        =   40
      Top             =   240
      Width           =   2055
   End
End
Attribute VB_Name = "dlgMainWnd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'================================================================================
' Private Members
'================================================================================
' data members
Private m_contractInfo As TWSLib.IContract
Private m_orderInfo As TWSLib.IOrder
Private m_execFilter As TWSLib.IExecutionFilter
Private m_underComp As TWSLib.IUnderComp

Private m_dlgOrder As New dlgOrder
Private m_dlgConnect As New dlgConnect
Private m_dlgMktDepth As New dlgMktDepth
Private m_dlgAcctData As New dlgAcctData
Private m_utils As New Utils
Private m_dlgNewsBulletins As New dlgNewsBulletins
Private m_dlgLogConfig As New dlgLogConfig
Private m_dlgFinancialAdvisor As New dlgFinancialAdvisor
Private m_dlgScanner As New dlgScanner

Private m_faAccount, faError As Boolean
Private m_faAcctsList As String
Private faGroupXML, faProfilesXML, faAliasesXML As String
Dim faErrorCodes(0 To 5) As Long
Const MKT_DEPTH_DATA_RESET As Long = 317
Public m_maxLong As Long
Public m_maxDouble As Double


'================================================================================
' Public functions
'================================================================================
Public Property Get isFAAccount() As Boolean
     isFAAccount = m_faAccount
End Property
Public Property Get FAManagedAccounts() As String
    FAManagedAccounts = m_faAcctsList
End Property
Public Sub requestScannerParameters()
    Call Tws1.reqScannerParameters
End Sub
Public Sub cancelScannerSubscription(ByVal id As Long)
    Call Tws1.cancelScannerSubscription(id)
End Sub
Public Sub scannerSubscription(ByVal id As Long, ByVal subscription As TWSLib.IScannerSubscription)
    Call Tws1.reqScannerSubscriptionEx(id, subscription)
End Sub

'================================================================================
' Button Events
'================================================================================
'--------------------------------------------------------------------------------
' Connect this API client to the TWS instance
'--------------------------------------------------------------------------------
Private Sub cmdConnect_Click()
    ' assume this is a non Financial Advisor account. If it is the managedAccounts()
    ' event will be fired.
    m_faAccount = False
    
    m_dlgConnect.Show vbModal
    If m_dlgConnect.ok Then
        With m_dlgConnect
            Call m_utils.addListItem(SERVER_RESPONSES, _
                 "Connecting to Tws using clientId " & .clientId & " ...")
            Call Tws1.Connect(.hostIP, .port, .clientId)
            If (Tws1.serverVersion() > 0) Then
                Dim msg As String
                msg = "Connected to Tws server version " & Tws1.serverVersion() & _
                      " at " & Tws1.TwsConnectionTime()
                Call m_utils.addListItem(SERVER_RESPONSES, msg)
            End If
        End With
    End If
End Sub

'--------------------------------------------------------------------------------
' Disconnect this API client from the TWS instance
'--------------------------------------------------------------------------------
Private Sub cmdDisconnect_Click()
    Call Tws1.disconnect
End Sub

'--------------------------------------------------------------------------------
' Request market data type
'--------------------------------------------------------------------------------
Private Sub cmdReqMarketDataType_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.REQ_MARKET_DATA_TYPE, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.reqMarketDataType(m_dlgOrder.marketDataType)
    End If

End Sub

'--------------------------------------------------------------------------------
' Request market data for a security
'--------------------------------------------------------------------------------
Private Sub cmdReqMktData_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.REQ_MKT_DATA_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.reqMktDataEx(m_dlgOrder.orderId, m_contractInfo, _
                m_dlgOrder.genericTickTags, m_dlgOrder.snapshotMktData)
    End If

End Sub

'--------------------------------------------------------------------------------
' Cancel market data for a security
'--------------------------------------------------------------------------------
Private Sub cmdCancelMktData_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CANCEL_MKT_DATA_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.cancelMktData(m_dlgOrder.orderId)
    End If
End Sub

'--------------------------------------------------------------------------------
' Request market depth for a security
'--------------------------------------------------------------------------------
Private Sub cmdReqMktDepth_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.REQ_MKT_DEPTH_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
    
        Call Tws1.reqMktDepthEx(m_dlgOrder.orderId, m_contractInfo, m_dlgOrder.numRows)
        m_dlgMktDepth.Show vbModal
        
        ' unsubscribe to mkt depth when the dialog is closed
        Call Tws1.cancelMktDepth(m_dlgOrder.orderId)

    End If

End Sub

'--------------------------------------------------------------------------------
' Cancel market depth for a security
'--------------------------------------------------------------------------------
Private Sub cmdCancelMktDepth_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CANCEL_MKT_DEPTH_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.cancelMktDepth(m_dlgOrder.orderId)
    End If
End Sub

'--------------------------------------------------------------------------------
' Request historical market data for a security
'--------------------------------------------------------------------------------
Private Sub cmdReqHistoricalData_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.REQ_HISTORICAL_DATA, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        If m_dlgOrder.whatToShow = "estimates" Or _
           m_dlgOrder.whatToShow = "finstat" Or _
           m_dlgOrder.whatToShow = "snapshot" Then
           Call Tws1.reqFundamentalData(m_dlgOrder.orderId, m_contractInfo, m_dlgOrder.whatToShow)
        Else
           Call Tws1.reqHistoricalDataEx(m_dlgOrder.orderId, m_contractInfo, _
                    m_dlgOrder.endDateTime, m_dlgOrder.duration, m_dlgOrder.barSizeSetting, _
                    m_dlgOrder.whatToShow, m_dlgOrder.useRTH, m_dlgOrder.formatDate)
        End If
    End If
End Sub

'--------------------------------------------------------------------------------
' Cancel historical market data for a security
'--------------------------------------------------------------------------------
Private Sub cmdCancelHistData_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CANCEL_HIST_DATA_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        If m_dlgOrder.whatToShow = "estimates" Or _
           m_dlgOrder.whatToShow = "finstat" Or _
           m_dlgOrder.whatToShow = "snapshot" Then
           Call Tws1.cancelFundamentalData(m_dlgOrder.orderId)
        Else
           Call Tws1.cancelHistoricalData(m_dlgOrder.orderId)
        End If
    End If
End Sub

'--------------------------------------------------------------------------------
' Request real time bars for a security
'--------------------------------------------------------------------------------
Private Sub cmdReqRealTimeBars_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.REQ_REAL_TIME_BARS, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.reqRealTimeBarsEx(m_dlgOrder.orderId, m_contractInfo, _
                                    5, m_dlgOrder.whatToShow, m_dlgOrder.useRTH)
    End If
End Sub

'--------------------------------------------------------------------------------
' Cancel real time bars for a security
'--------------------------------------------------------------------------------
Private Sub cmdCancelRealTimeBars_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CANCEL_HIST_DATA_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.cancelRealTimeBars(m_dlgOrder.orderId)
    End If
End Sub

'--------------------------------------------------------------------------------
' Request current server time
'--------------------------------------------------------------------------------
Private Sub cmdReqCurrentTime_Click()
    Call Tws1.reqCurrentTime
End Sub

'--------------------------------------------------------------------------------
' Perform market scans
'--------------------------------------------------------------------------------
Private Sub cmdScanner_Click()
    m_dlgScanner.Show vbModal
End Sub

'--------------------------------------------------------------------------------
' Place a new or modify an existing order
'--------------------------------------------------------------------------------
Private Sub cmdWhatIf_Click()
    placeOrderImpl (True)
End Sub
Private Sub cmdPlaceOrder_Click()
    placeOrderImpl (False)
End Sub
Private Sub placeOrderImpl(ByVal whatIf As Boolean)
    
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.PLACE_ORDER_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Dim savedWhatIf As Boolean
        savedWhatIf = m_orderInfo.whatIf
        m_orderInfo.whatIf = whatIf
        Call Tws1.placeOrderEx(m_dlgOrder.orderId, m_contractInfo, m_orderInfo)
        m_orderInfo.whatIf = savedWhatIf
    End If
End Sub

'--------------------------------------------------------------------------------
' Cancel an exisiting order
'--------------------------------------------------------------------------------
Private Sub cmdCancelOrder_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CANCEL_ORDER_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.cancelOrder(m_dlgOrder.orderId)
    End If
End Sub

'--------------------------------------------------------------------------------
' Exercise options
'--------------------------------------------------------------------------------
Private Sub cmdExerciseOptions_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.EXERCISE_OPTIONS, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        ' TODO: get account in a less convoluted way
        Call Tws1.exerciseOptionsEx(m_dlgOrder.orderId, m_contractInfo, _
                        m_dlgOrder.exerciseAction, m_dlgOrder.exerciseQuantity, _
                        m_orderInfo.account, m_dlgOrder.exerciseOverride)
    End If
End Sub

'--------------------------------------------------------------------------------
' Sets the extended order attributes
'--------------------------------------------------------------------------------
Private Sub cmdExtendedOrderAtribs_Click()
    Dim dlgOrderAttribs As New dlgOrderAttribs
    
    dlgOrderAttribs.init Me, m_orderInfo
    dlgOrderAttribs.Show vbModal
    ' nothing to do besides that
End Sub

'--------------------------------------------------------------------------------
' Request the details for a contract
'--------------------------------------------------------------------------------
Private Sub cmdReqContractData_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.REQ_CONTRACT_DETAILS_DLG, m_contractInfo, m_orderInfo, m_underComp, Me
    
    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.reqContractDetailsEx(m_dlgOrder.orderId, m_contractInfo)
    End If
End Sub

'--------------------------------------------------------------------------------
' Request all the API open orders that were placed by this client. Note the
' clientID with a client id of 0 returns its, plus the TWS TWS open orders. Once
' requested the TWS orders retain their API asociation.
'--------------------------------------------------------------------------------
Private Sub cmdReqOpenOrders_Click()
    Call Tws1.reqOpenOrders
End Sub

'--------------------------------------------------------------------------------
' Request the lsit of all the current open orders (from API clients and TWS). Note
' that no API order assoication is made.
'--------------------------------------------------------------------------------
Private Sub cmdReqAllOpenOrders_Click()
    Call Tws1.reqAllOpenOrders
End Sub

'--------------------------------------------------------------------------------
' Request that all new TWS orders are automatically associated with this client.
' NOTE: This feature is only available for a client with client id of 0.
'--------------------------------------------------------------------------------
Private Sub cmdReqAutoOpenOrders_Click()
    Call Tws1.reqAutoOpenOrders(True)
End Sub

'--------------------------------------------------------------------------------
' Requests account details
'--------------------------------------------------------------------------------
Private Sub cmdReqAcctData_Click()
    Dim dlg As New dlgAcctUpdates
       
    dlg.Show vbModal
    If (dlg.ok) Then
        If dlg.subscribe Then
            m_dlgAcctData.accountDownloadBegin (dlg.acctCode)
        End If
        Call Tws1.reqAccountUpdates(dlg.subscribe, dlg.acctCode)
        If dlg.subscribe Then
            m_dlgAcctData.Show vbModal
        End If
    End If
End Sub

'--------------------------------------------------------------------------------
' Request all todays execution reports
'--------------------------------------------------------------------------------
Private Sub cmdReqExecutions_Click()
    Dim dlgExecFilter As New dlgExecFilter
    
    dlgExecFilter.init m_execFilter
    dlgExecFilter.Show vbModal
    If dlgExecFilter.ok Then
        Call Tws1.reqExecutionsEx(dlgExecFilter.reqId, m_execFilter)
    End If
End Sub

'--------------------------------------------------------------------------------
' Requests the next avaliable order id for placing an order
'--------------------------------------------------------------------------------
Private Sub cmdReqIds_Click()
    Call Tws1.reqIds(1)
End Sub

'--------------------------------------------------------------------------------
' Requests to be notified for new IB news bulletins
'--------------------------------------------------------------------------------
Private Sub cmdReqNews_Click()
    m_dlgNewsBulletins.Show vbModal
    If m_dlgNewsBulletins.ok Then
        If m_dlgNewsBulletins.subscribe = True Then
            Call Tws1.reqNewsBulletins(m_dlgNewsBulletins.allMsgs)
        Else
            Call Tws1.cancelNewsBulletins
        End If
    End If
End Sub

'--------------------------------------------------------------------------------
' Sets the TWS server logging level
'--------------------------------------------------------------------------------
Private Sub cmdServerLogLevel_Click()
    m_dlgLogConfig.Show vbModal
    If m_dlgLogConfig.ok Then
        Call Tws1.setServerLogLevel(m_dlgLogConfig.serverLogLevel())
    End If
End Sub

'--------------------------------------------------------------------------------
' Request managed accounts
'--------------------------------------------------------------------------------
Private Sub cmdReqAccts_Click()
    Call Tws1.reqManagedAccts
End Sub
Private Sub cmdFinancialAdvisor_Click()
      faGroupXML = ""
      faProfilesXML = ""
      faAliasesXML = ""
      faError = False
      Call Tws1.requestFA(ALIASES)
      Call Tws1.requestFA(GROUPS)
      Call Tws1.requestFA(PROFILES)
End Sub

'--------------------------------------------------------------------------------
' Calculate Implied Volatility
'--------------------------------------------------------------------------------
Private Sub cmdCalculateImpliedVolatility_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CALCULATE_IMPLIED_VOLATILITY, m_contractInfo, m_orderInfo, m_underComp, Me

    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.calculateImpliedVolatility(m_dlgOrder.orderId, m_contractInfo, m_orderInfo.lmtPrice, m_orderInfo.auxPrice)
    End If
End Sub

'--------------------------------------------------------------------------------
' Calculate Option Price
'--------------------------------------------------------------------------------
Private Sub cmdCalculateOptionPrice_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CALCULATE_OPTION_PRICE, m_contractInfo, m_orderInfo, m_underComp, Me

    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.calculateOptionPrice(m_dlgOrder.orderId, m_contractInfo, m_orderInfo.lmtPrice, m_orderInfo.auxPrice)
    End If
End Sub

'--------------------------------------------------------------------------------
' Cancel Calculate Implied Volatility
'--------------------------------------------------------------------------------
Private Sub cmdCancelCalculateImpliedVolatility_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CANCEL_CALCULATE_IMPLIED_VOLATILITY, m_contractInfo, m_orderInfo, m_underComp, Me

    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.cancelCalculateImpliedVolatility(m_dlgOrder.orderId)
    End If
End Sub

'--------------------------------------------------------------------------------
' Cancel Calculate Option Price
'--------------------------------------------------------------------------------
Private Sub cmdCancelCalculateOptionPrice_Click()
    ' Set the dialog state
    m_dlgOrder.init Dlg_Type.CANCEL_CALCULATE_OPTION_PRICE, m_contractInfo, m_orderInfo, m_underComp, Me

    m_dlgOrder.Show vbModal
    If m_dlgOrder.ok Then
        Call Tws1.cancelCalculateOptionPrice(m_dlgOrder.orderId)
    End If
End Sub

'--------------------------------------------------------------------------------
' Request global cancel
'--------------------------------------------------------------------------------
Private Sub cmdReqGlobalCancel_Click()
    Call Tws1.reqGlobalCancel()
End Sub

'--------------------------------------------------------------------------------
' Request Positions
'--------------------------------------------------------------------------------
Private Sub cmdReqPositions_Click()
    Call Tws1.reqPositions
End Sub

'--------------------------------------------------------------------------------
' Cancel Positions
'--------------------------------------------------------------------------------
Private Sub cmdCancelPositions_Click()
    Call Tws1.cancelPositions
End Sub

'--------------------------------------------------------------------------------
' Request account summary
'--------------------------------------------------------------------------------
Private Sub cmdReqAccountSummary_Click()
    Dim dlg As New dlgAccountSummary
    
    ' Set the dialog state
    dlg.init Acct_Summ_Dlg_Type.REQUEST_ACCOUNT_SUMMARY
    dlg.Show vbModal
    If dlg.ok Then
        Call Tws1.reqAccountSummary(dlg.reqId, dlg.groupName, dlg.tags)
    End If
End Sub

'--------------------------------------------------------------------------------
' Cancel account summary
'--------------------------------------------------------------------------------
Private Sub cmdCancelAccountSummary_Click()
    Dim dlg As New dlgAccountSummary
    
    ' Set the dialog state
    dlg.init Acct_Summ_Dlg_Type.CANCEL_ACCOUNT_SUMMARY
    dlg.Show vbModal
    If dlg.ok Then
        Call Tws1.cancelAccountSummary(dlg.reqId)
    End If
End Sub

'--------------------------------------------------------------------------------
' Clear the form display lists
'--------------------------------------------------------------------------------
Private Sub cmdClearForm_Click()
    lstMktData.clear
    lstServerResponses.clear
    lstErrors.clear
End Sub

'--------------------------------------------------------------------------------
' Shutdown the app
'--------------------------------------------------------------------------------
Private Sub cmdClose_Click()
    Unload Me
End Sub

'================================================================================
' TWS Events
'================================================================================
'--------------------------------------------------------------------------------
' Returns the next valid order id upon connection - triggered by the connect() and
' reqNextValidId() methods
'--------------------------------------------------------------------------------
Private Sub Tws1_nextValidId(ByVal id As Long)
    m_dlgOrder.orderId = id
End Sub

'--------------------------------------------------------------------------------
' Notify the users of any API request processing errors and displays them in the
' server responses listbox
'--------------------------------------------------------------------------------
Private Sub Tws1_errMsg(ByVal id As Long, ByVal errorCode As Long, ByVal errorMsg As String)
    Dim msg As String
    Dim ctr As Long

    msg = "id: " & id & " | Error Code: " & errorCode & " | Error Msg: " & errorMsg
    Call m_utils.addListItem(ERRORS, msg)

    ' move into view
    lstErrors.TopIndex = lstErrors.ListCount - 1
    
    For ctr = 0 To 5
        If errorCode = faErrorCodes(ctr) Then faError = True
    Next ctr
    
    If errorCode = MKT_DEPTH_DATA_RESET Then
        m_dlgMktDepth.clear
    End If
End Sub

'--------------------------------------------------------------------------------
' Notification that the TWS-API connection has been broken.
'--------------------------------------------------------------------------------
Private Sub Tws1_connectionClosed()
    Call m_utils.addListItem(ERRORS, "Connection to TWS has been closed")
    
    ' move into view
    lstErrors.TopIndex = lstErrors.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Market data price tick event - triggered by the reqMktDataEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_tickPrice(ByVal id As Long, ByVal tickType As Long, ByVal price As Double, ByVal canAutoExecute As Long)
    Dim mktDataStr As String
    
    
    mktDataStr = "id=" & id & " " & m_utils.getField(tickType) & "=" & price
    If (canAutoExecute <> 0) Then
       mktDataStr = mktDataStr & " canAutoExecute"
    Else
       mktDataStr = mktDataStr & " noAutoExecute"
    End If
    Call m_utils.addListItem(MKT_DATA, mktDataStr)
    
    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Market data size tick event - triggered by the reqMktDataEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_tickSize(ByVal id As Long, ByVal tickType As Long, ByVal size As Long)
    Dim mktDataStr As String
    
    mktDataStr = "id=" & id & " " & m_utils.getField(tickType) & "=" & size
    Call m_utils.addListItem(MKT_DATA, mktDataStr)
    
    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Market data generic tick event - triggered by the reqMktDataEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_tickGeneric(ByVal id As Long, ByVal tickType As Long, ByVal value As Double)
    Dim mktDataStr As String
    
    mktDataStr = "id=" & id & " " & m_utils.getField(tickType) & "=" & value
    Call m_utils.addListItem(MKT_DATA, mktDataStr)
    
    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Market data string tick event - triggered by the reqMktDataEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_tickString(ByVal id As Long, ByVal tickType As Long, ByVal value As String)
    Dim mktDataStr As String
    
    mktDataStr = "id=" & id & " " & m_utils.getField(tickType) & "=" & value
    Call m_utils.addListItem(MKT_DATA, mktDataStr)
    
    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Market data EFP computation event - triggered by the reqMktDataEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_tickEFP(ByVal tickerId As Long, ByVal tickType As Long, ByVal basisPoints As Double, _
                           ByVal formattedBasisPoints As String, ByVal totalDividends As Double, _
                           ByVal holdDays As Long, ByVal futureExpiry As String, ByVal dividendImpact As Double, _
                           ByVal dividendsToExpiry As Double)
    Dim mktDataStr As String
    
    mktDataStr = "id=" & tickerId & " " & m_utils.getField(tickType) & ":" & basisPoints & " / " & formattedBasisPoints & _
                 " totalDividends=" & totalDividends & " holdDays=" & holdDays & " futureExpiry=" & futureExpiry & _
                 " dividendImpact=" & dividendImpact & " dividendsToExpiry=" & dividendsToExpiry
    Call m_utils.addListItem(MKT_DATA, mktDataStr)
    
    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Market data option computation tick event - triggered by the reqMktDataEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_tickOptionComputation(ByVal id As Long, ByVal theTickType As Long, _
                                       ByVal impliedVol As Double, ByVal delta As Double, _
                                       ByVal optPrice As Double, ByVal pvDividend As Double, _
                                       ByVal gamma As Double, ByVal vega As Double, ByVal theta As Double, _
                                       ByVal undPrice As Double)
                                       
    Dim mktDataStr As String, impliedVolStr As String, deltaStr As String, gammaStr As String, vegaStr As String, thetaStr As String, _
        optPriceStr As String, pvDividendStr As String, undPriceStr As String
    If impliedVol = m_maxDouble Or impliedVol < 0 Then
        impliedVolStr = "N/A"
    Else
        impliedVolStr = impliedVol
    End If
    If delta = m_maxDouble Or Abs(delta) > 1 Then
        deltaStr = "N/A"
    Else
        deltaStr = delta
    End If
    If gamma = m_maxDouble Or Abs(gamma) > 1 Then
        gammaStr = "N/A"
    Else
        gammaStr = gamma
    End If
    If vega = m_maxDouble Or Abs(vega) > 1 Then
        vegaStr = "N/A"
    Else
        vegaStr = vega
    End If
    If theta = m_maxDouble Or Abs(theta) > 1 Then
        thetaStr = "N/A"
    Else
        thetaStr = theta
    End If
    If optPrice = m_maxDouble Then
        optPriceStr = "N/A"
    Else
        optPriceStr = optPrice
    End If
    If pvDividend = m_maxDouble Then
        pvDividendStr = "N/A"
    Else
        pvDividendStr = pvDividend
    End If
    If undPrice = m_maxDouble Then
        undPriceStr = "N/A"
    Else
        undPriceStr = undPrice
    End If

    mktDataStr = "id = " & id & " " & m_utils.getField(theTickType) & " vol = " & impliedVolStr & " delta = " & deltaStr & _
        " gamma = " & gammaStr & " vega = " & vegaStr & " theta = " & thetaStr & _
        " optPrice = " & optPriceStr & " pvDividend = " & pvDividendStr & " undPrice = " & undPriceStr
    Call m_utils.addListItem(MKT_DATA, mktDataStr)
End Sub

'--------------------------------------------------------------------------------
' Market depth book entry - triggered by the reqMktDepthEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_updateMktDepth(ByVal tickerId As Long, ByVal Position As Long, _
        ByVal operation As Long, ByVal side As Long, ByVal price As Double, ByVal size As Long)
    m_dlgMktDepth.updateMktDepth tickerId, Position, " ", operation, side, price, size
End Sub

'--------------------------------------------------------------------------------
' Market depth Level II book entry - triggered by the reqMktDepthEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_updateMktDepthL2(ByVal id As Long, ByVal Position As Long, _
        ByVal marketMaker As String, ByVal operation As Long, ByVal side As Long, _
        ByVal price As Double, ByVal size As Long)
    m_dlgMktDepth.updateMktDepth id, Position, marketMaker, operation, side, price, size
End Sub

'--------------------------------------------------------------------------------
' Historical data tick event - triggered by the reqHistoricalDataEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_historicalData(ByVal reqId As Long, ByVal pdate As String, ByVal popen As Double, _
                                 ByVal high As Double, ByVal low As Double, ByVal pclose As Double, _
                                 ByVal volume As Long, ByVal barCount As Long, ByVal WAP As Double, ByVal hasGaps As Long)
    Dim mktDataStr As String
    mktDataStr = "id=" & reqId & " date=" & pdate & " open=" & popen & " high=" & high & _
                 " low=" & low & " close=" & pclose & " volume=" & volume & _
                 " barCount=" & barCount & " WAP=" & WAP
    If (hasGaps <> 0) Then
       mktDataStr = mktDataStr & " has gaps"
    Else
       mktDataStr = mktDataStr & " no gaps"
    End If
    Call m_utils.addListItem(MKT_DATA, mktDataStr)
    
    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Real Time Bar event - triggered by the reqRealTimeBarEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_realtimeBar(ByVal tickerId As Long, ByVal time As Long, _
    ByVal popen As Double, ByVal high As Double, ByVal low As Double, ByVal pclose As Double, _
    ByVal volume As Long, ByVal WAP As Double, ByVal Count As Long)
    
    Dim mktDataStr As String
    mktDataStr = "id=" & tickerId & " time=" & time & " open=" & popen & " high=" & high & _
                 " low=" & low & " close=" & pclose & " volume=" & volume & " WAP=" & WAP & " count=" & Count

    Call m_utils.addListItem(MKT_DATA, mktDataStr)
    
    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Fundamental data event - triggered by the reqFundamentalData() method
'--------------------------------------------------------------------------------
Private Sub Tws1_fundamentalData(ByVal reqId As Long, ByVal data As String)

    Call m_utils.addListItem(MKT_DATA, "fund reqId=" & reqId & " len=" & Len(data))
    Call m_utils.displayMultiline(MKT_DATA, data)
    
End Sub

'--------------------------------------------------------------------------------
' Current Time event - triggered by the reqCurrentTime() methods
'--------------------------------------------------------------------------------
Private Sub Tws1_currentTime(ByVal time As Long)

    Dim displayString As String
    displayString = "current time = " & time
    
    Call m_utils.addListItem(SERVER_RESPONSES, displayString)
 
    ' move into view
    lstServerResponses.TopIndex = lstServerResponses.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Market Scanner related events
'--------------------------------------------------------------------------------
Private Sub Tws1_scannerParameters(ByVal xml As String)
    Dim xmlDoc As DOMDocument50
    Set xmlDoc = ProduceXMLDoc
    Call xmlDoc.loadXML(xml)
    Dim node1 As IXMLDOMNode
    Set node1 = xmlDoc.selectSingleNode("/*")
    Call m_utils.addListItem(SERVER_RESPONSES, "SCANNER PARAMETERS " & node1.nodeName & " document.")
    Set node1 = node1.selectSingleNode("InstrumentList")
    Dim name1 As String, theType1 As String, name2 As String, theType2 As String
    name1 = parseNode(node1.firstChild, "name")
    theType1 = parseNode(node1.firstChild, "type")
    name2 = parseNode(node1.firstChild.nextSibling, "name")
    theType2 = parseNode(node1.firstChild.nextSibling, "type")
    Call m_utils.addListItem(SERVER_RESPONSES, "InstrumentList starts with (" & name1 & "," & theType1 & ") " & _
                             "followed by (" & name2 & "," & theType2 & ")")
    Call m_utils.displayMultiline(SERVER_RESPONSES, xmlDoc.xml)
End Sub

Private Sub Tws1_scannerDataEx(ByVal reqId As Long, ByVal rank As Long, ByVal contractDetails As TWSLib.IContractDetails, _
    ByVal distance As String, ByVal benchmark As String, ByVal projection As String, ByVal legsStr As String)
    
    Dim contract As TWSLib.IContract
    Set contract = contractDetails.summary
    
    Dim mktDataStr As String
    mktDataStr = "id=" & reqId & " rank=" & rank & " conId=" & contract.conId & _
                 " symbol=" & contract.symbol & " secType=" & contract.secType & " currency=" & contract.Currency & _
                 " localSymbol=" & contract.localSymbol & " marketName=" & contractDetails.marketName & _
                 " tradingClass=" & contract.tradingClass & " distance=" & distance & _
                 " benchmark=" & benchmark & " projection=" & projection & "legsStr= " & legsStr
    
    Call m_utils.addListItem(MKT_DATA, mktDataStr)
    
    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1
End Sub
Private Sub Tws1_scannerDataEnd(ByVal reqId As Long)
    Dim str As String

    str = "id=" & reqId & " =============== end ==============="
    Call m_utils.addListItem(MKT_DATA, str)

    ' move into view
    lstMktData.TopIndex = lstMktData.ListCount - 1

End Sub

'--------------------------------------------------------------------------------
' Notification of an updates order status - triggered by an order state change.
'--------------------------------------------------------------------------------
Private Sub Tws1_orderStatus(ByVal id As Long, ByVal status As String, ByVal filled As Long, _
        ByVal remaining As Long, ByVal avgFillPrice As Double, ByVal permId As Long, _
        ByVal parentId As Long, ByVal lastFillPrice As Double, ByVal clientId As Long, _
        ByVal whyHeld As String)
    Dim msg1 As String
    Dim msg2 As String

    msg1 = "order status: orderId=" & id & " client id=" & clientId & " permId=" & permId & _
           " status=" & status & " filled=" & filled & " remaining=" & remaining
    msg2 = "              avgFillPrice=" & avgFillPrice & " lastFillPrice=" & lastFillPrice & _
           " parentId=" & parentId & " whyHeld=" & whyHeld

    Call m_utils.addListItem(SERVER_RESPONSES, msg1)
    Call m_utils.addListItem(SERVER_RESPONSES, msg2)
    
    ' move into view
    lstServerResponses.TopIndex = lstServerResponses.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' The details for a requested contract - triggered by the reqContractDetailsEx() method
'--------------------------------------------------------------------------------
Private Sub Tws1_contractDetailsEx(ByVal reqId As Long, ByVal contractDetails As TWSLib.IContractDetails)

    Dim contract As TWSLib.IContract
    Set contract = contractDetails.summary
    
    Dim offset As Long
    offset = lstServerResponses.ListCount
        
    Call m_utils.addListItem(SERVER_RESPONSES, "reqId = " & reqId & " ===================================")
    
    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Contract Details Begin ----")
    Call m_utils.addListItem(SERVER_RESPONSES, "Contract:")
    Call m_utils.addListItem(SERVER_RESPONSES, "  conId = " & contract.conId)
    Call m_utils.addListItem(SERVER_RESPONSES, "  symbol = " & contract.symbol)
    Call m_utils.addListItem(SERVER_RESPONSES, "  secType = " & contract.secType)
    Call m_utils.addListItem(SERVER_RESPONSES, "  expiry = " & contract.expiry)
    Call m_utils.addListItem(SERVER_RESPONSES, "  strike = " & contract.strike)
    Call m_utils.addListItem(SERVER_RESPONSES, "  right = " & contract.Right)
    Call m_utils.addListItem(SERVER_RESPONSES, "  multiplier = " & contract.multiplier)
    Call m_utils.addListItem(SERVER_RESPONSES, "  exchange = " & contract.exchange)
    Call m_utils.addListItem(SERVER_RESPONSES, "  primaryExchange = " & contract.primaryExchange)
    Call m_utils.addListItem(SERVER_RESPONSES, "  currency = " & contract.Currency)
    Call m_utils.addListItem(SERVER_RESPONSES, "  localSymbol = " & contract.localSymbol)
    Call m_utils.addListItem(SERVER_RESPONSES, "  tradingClass = " & contract.tradingClass)
    
    Call m_utils.addListItem(SERVER_RESPONSES, "Details:")
    Call m_utils.addListItem(SERVER_RESPONSES, "  marketName = " & contractDetails.marketName)
    Call m_utils.addListItem(SERVER_RESPONSES, "  minTick = " & contractDetails.minTick)
    Call m_utils.addListItem(SERVER_RESPONSES, "  priceMagnifier = " & contractDetails.priceMagnifier)
    Call m_utils.addListItem(SERVER_RESPONSES, "  orderTypes = " & contractDetails.orderTypes)
    Call m_utils.addListItem(SERVER_RESPONSES, "  validExchanges = " & contractDetails.validExchanges)
    Call m_utils.addListItem(SERVER_RESPONSES, "  underConId = " & contractDetails.underConId)
    Call m_utils.addListItem(SERVER_RESPONSES, "  longName = " & contractDetails.longName)

	If (contract.secType <> "BOND") Then
		Call m_utils.addListItem(SERVER_RESPONSES, "  contractMonth = " & contractDetails.contractMonth)
		Call m_utils.addListItem(SERVER_RESPONSES, "  industry = " & contractDetails.industry)
		Call m_utils.addListItem(SERVER_RESPONSES, "  category = " & contractDetails.category)
		Call m_utils.addListItem(SERVER_RESPONSES, "  subcategory = " & contractDetails.subcategory)
		Call m_utils.addListItem(SERVER_RESPONSES, "  timeZoneId = " & contractDetails.timeZoneId)
		Call m_utils.addListItem(SERVER_RESPONSES, "  tradingHours = " & contractDetails.tradingHours)
		Call m_utils.addListItem(SERVER_RESPONSES, "  liquidHours = " & contractDetails.liquidHours)
	End If
    Call m_utils.addListItem(SERVER_RESPONSES, "  evRule = " & contractDetails.evRule)
    Call m_utils.addListItem(SERVER_RESPONSES, "  evMultiplier = " & contractDetails.evMultiplier)
        
    If (contract.secType = "BOND") Then

        Call m_utils.addListItem(SERVER_RESPONSES, "Bond Details:")
        Call m_utils.addListItem(SERVER_RESPONSES, "  cusip = " & contractDetails.cusip)
        Call m_utils.addListItem(SERVER_RESPONSES, "  ratings = " & contractDetails.ratings)
        Call m_utils.addListItem(SERVER_RESPONSES, "  descAppend = " & contractDetails.descAppend)
        Call m_utils.addListItem(SERVER_RESPONSES, "  bondType = " & contractDetails.bondType)
        Call m_utils.addListItem(SERVER_RESPONSES, "  couponType = " & contractDetails.couponType)
        Call m_utils.addListItem(SERVER_RESPONSES, "  callable = " & contractDetails.callable)
        Call m_utils.addListItem(SERVER_RESPONSES, "  putable = " & contractDetails.putable)
        Call m_utils.addListItem(SERVER_RESPONSES, "  coupon = " & contractDetails.coupon)
        Call m_utils.addListItem(SERVER_RESPONSES, "  convertible = " & contractDetails.convertible)
        Call m_utils.addListItem(SERVER_RESPONSES, "  maturity = " & contractDetails.maturity)
        Call m_utils.addListItem(SERVER_RESPONSES, "  issueDate = " & contractDetails.issueDate)
        Call m_utils.addListItem(SERVER_RESPONSES, "  nextOptionDate = " & contractDetails.nextOptionDate)
        Call m_utils.addListItem(SERVER_RESPONSES, "  nextOptionType = " & contractDetails.nextOptionType)
        Call m_utils.addListItem(SERVER_RESPONSES, "  nextOptionPartial = " & contractDetails.nextOptionPartial)
        Call m_utils.addListItem(SERVER_RESPONSES, "  notes = " & contractDetails.notes)
        

    End If
    
    ' CUSIP/ISIN/etc.
    Call m_utils.addListItem(SERVER_RESPONSES, "  secIdList={")
    Dim secIdList As TWSLib.ITagValueList
    Set secIdList = contractDetails.secIdList
    If (Not secIdList Is Nothing) Then
        Dim secIdListCount As Long
        secIdListCount = secIdList.Count
        Dim iLoop As Long
        For iLoop = 0 To secIdListCount - 1
            Dim param As TWSLib.ITagValue
            Set param = secIdList.Item(iLoop)
            Call m_utils.addListItem(SERVER_RESPONSES, "    " & param.tag & "=" & param.value)
        Next iLoop
    End If
    Call m_utils.addListItem(SERVER_RESPONSES, "  }")
    
    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Contract Details End ----")
    
    ' move into view
    lstServerResponses.TopIndex = offset
End Sub
Private Sub Tws1_contractDetailsEnd(ByVal reqId As Long)

    Call m_utils.addListItem(SERVER_RESPONSES, "reqId = " & reqId & " =============== end ===============")

    ' move into view
    lstServerResponses.TopIndex = lstServerResponses.ListCount - 1

End Sub

'--------------------------------------------------------------------------------
' Returns the details for an open order - triggered by the reqOpenOrders() method
'--------------------------------------------------------------------------------
Private Sub Tws1_openOrderEx(ByVal orderId As Long, ByVal contract As TWSLib.IContract, _
    ByVal order As TWSLib.IOrder, ByVal orderState As TWSLib.IOrderState)

    Call m_utils.addListItem(SERVER_RESPONSES, "OpenOrderEx called, orderId=" & orderId)
    
    Call m_utils.addListItem(SERVER_RESPONSES, "Order:")
    Call m_utils.addListItem(SERVER_RESPONSES, "  orderId=" & order.orderId)
    Call m_utils.addListItem(SERVER_RESPONSES, "  clientId=" & order.clientId)
    Call m_utils.addListItem(SERVER_RESPONSES, "  permId=" & order.permId)
    Call m_utils.addListItem(SERVER_RESPONSES, "  action=" & order.Action)
    Call m_utils.addListItem(SERVER_RESPONSES, "  quantity=" & order.totalQuantity)
    Call m_utils.addListItem(SERVER_RESPONSES, "  orderType=" & order.orderType)
    Call m_utils.addListItem(SERVER_RESPONSES, "  lmtPrice=" & DblMaxStr(order.lmtPrice))
    Call m_utils.addListItem(SERVER_RESPONSES, "  auxPrice=" & DblMaxStr(order.auxPrice))
    
    Call m_utils.addListItem(SERVER_RESPONSES, "Contract:")
    Call m_utils.addListItem(SERVER_RESPONSES, "  conId=" & contract.conId)
    Call m_utils.addListItem(SERVER_RESPONSES, "  symbol=" & contract.symbol)
    Call m_utils.addListItem(SERVER_RESPONSES, "  secType=" & contract.secType)
    Call m_utils.addListItem(SERVER_RESPONSES, "  expiry=" & contract.expiry)
    Call m_utils.addListItem(SERVER_RESPONSES, "  strike=" & contract.strike)
    Call m_utils.addListItem(SERVER_RESPONSES, "  right=" & contract.Right)
    Call m_utils.addListItem(SERVER_RESPONSES, "  multiplier=" & contract.multiplier)
    Call m_utils.addListItem(SERVER_RESPONSES, "  exchange=" & contract.exchange)
    Call m_utils.addListItem(SERVER_RESPONSES, "  primaryExchange=" & contract.primaryExchange)
    Call m_utils.addListItem(SERVER_RESPONSES, "  currency=" & contract.Currency)
    Call m_utils.addListItem(SERVER_RESPONSES, "  localSymbol=" & contract.localSymbol)
    Call m_utils.addListItem(SERVER_RESPONSES, "  tradingClass=" & contract.tradingClass)
    Call m_utils.addListItem(SERVER_RESPONSES, "  comboLegsDesc=" & contract.comboLegsDescrip)
    
    ' combo legs
    Call m_utils.addListItem(SERVER_RESPONSES, "  comboLegs={")

    If Not contract.comboLegs Is Nothing Then
        Dim comboLegsCount As Long
        Dim orderComboLegsCount As Long
        comboLegsCount = contract.comboLegs.Count
        orderComboLegsCount = 0

        If Not order.orderComboLegs Is Nothing Then
            orderComboLegsCount = order.orderComboLegs.Count()
        End If

        Dim iLoop As Long
        For iLoop = 0 To comboLegsCount - 1
            Dim comboLeg As TWSLib.IComboLeg
            Set comboLeg = contract.comboLegs.Item(iLoop)
            Dim orderComboLegPriceStr As String
            orderComboLegPriceStr = ""

            If comboLegsCount = orderComboLegsCount Then
                Dim orderComboLeg As TWSLib.IOrderComboLeg
                Set orderComboLeg = order.orderComboLegs.Item(iLoop)
                orderComboLegPriceStr = " price=" & DblMaxStr(orderComboLeg.price)
            End If

            Call m_utils.addListItem(SERVER_RESPONSES, "    leg " & (iLoop + 1) & _
            ": conId=" & comboLeg.conId & " ratio=" & comboLeg.ratio & " action=" & comboLeg.action & _
            " exchange = " & comboLeg.exchange & " openClose=" & comboLeg.openClose & _
            " shortSaleSlot=" & comboLeg.shortSaleSlot & " designatedLocation=" & comboLeg.designatedLocation & _
            " exemptCode=" & comboLeg.exemptCode & orderComboLegPriceStr)
        Next iLoop
    End If
    Call m_utils.addListItem(SERVER_RESPONSES, "  }")	

    Dim underComp As TWSLib.IUnderComp
    Set underComp = contract.underComp
    
    If (Not underComp Is Nothing) Then
        With underComp
            Call m_utils.addListItem(SERVER_RESPONSES, "  underComp.conId=" & .conId)
            Call m_utils.addListItem(SERVER_RESPONSES, "  underComp.delta=" & .delta)
            Call m_utils.addListItem(SERVER_RESPONSES, "  underComp.delta=" & .price)
        End With
    End If
    
    Call m_utils.addListItem(SERVER_RESPONSES, "Order (extended):")
    Call m_utils.addListItem(SERVER_RESPONSES, "  timeInForce=" & order.timeInForce)
    Call m_utils.addListItem(SERVER_RESPONSES, "  ocaGroup=" & order.ocaGroup)
    Call m_utils.addListItem(SERVER_RESPONSES, "  ocaType=" & order.ocaType)
    Call m_utils.addListItem(SERVER_RESPONSES, "  orderRef=" & order.orderRef)
    Call m_utils.addListItem(SERVER_RESPONSES, "  transmit=" & order.transmit)
    Call m_utils.addListItem(SERVER_RESPONSES, "  parentId=" & order.parentId)
    Call m_utils.addListItem(SERVER_RESPONSES, "  blockOrder=" & order.blockOrder)
    Call m_utils.addListItem(SERVER_RESPONSES, "  sweepToFill=" & order.sweepToFill)
    Call m_utils.addListItem(SERVER_RESPONSES, "  displaySize=" & order.displaySize)
    Call m_utils.addListItem(SERVER_RESPONSES, "  triggerMethod=" & order.triggerMethod)
    Call m_utils.addListItem(SERVER_RESPONSES, "  outsideRth=" & order.outsideRth)
    Call m_utils.addListItem(SERVER_RESPONSES, "  hidden=" & order.Hidden)
    Call m_utils.addListItem(SERVER_RESPONSES, "  goodAfterTime=" & order.goodAfterTime)
    Call m_utils.addListItem(SERVER_RESPONSES, "  goodTillDate=" & order.goodTillDate)
    Call m_utils.addListItem(SERVER_RESPONSES, "  overridePercentageConstraints=" & order.overridePercentageConstraints)
    Call m_utils.addListItem(SERVER_RESPONSES, "  rule80A=" & order.rule80A)
    Call m_utils.addListItem(SERVER_RESPONSES, "  allOrNone=" & order.allOrNone)
    Call m_utils.addListItem(SERVER_RESPONSES, "  minQty=" & LongMaxStr(order.minQty))
    Call m_utils.addListItem(SERVER_RESPONSES, "  percentOffset=" & DblMaxStr(order.percentOffset))
    Call m_utils.addListItem(SERVER_RESPONSES, "  trailStopPrice=" & DblMaxStr(order.trailStopPrice))
    Call m_utils.addListItem(SERVER_RESPONSES, "  trailingPercent=" & DblMaxStr(order.trailingPercent))
    Call m_utils.addListItem(SERVER_RESPONSES, "  whatIf=" & order.whatIf)
    Call m_utils.addListItem(SERVER_RESPONSES, "  notHeld=" & order.notHeld)
    
    ' Financial advisors only
    Call m_utils.addListItem(SERVER_RESPONSES, "  faGroup=" & order.faGroup)
    Call m_utils.addListItem(SERVER_RESPONSES, "  faProfile=" & order.faProfile)
    Call m_utils.addListItem(SERVER_RESPONSES, "  faMethod=" & order.faMethod)
    Call m_utils.addListItem(SERVER_RESPONSES, "  faPercentage=" & order.faPercentage)

    ' Clearing info
    Call m_utils.addListItem(SERVER_RESPONSES, "  account=" & order.account)
    Call m_utils.addListItem(SERVER_RESPONSES, "  settlingFirm=" & order.settlingFirm)
    Call m_utils.addListItem(SERVER_RESPONSES, "  clearingAccount=" & order.clearingAccount)
    Call m_utils.addListItem(SERVER_RESPONSES, "  clearingIntent=" & order.clearingIntent)
    
    ' Institutional orders only
    Call m_utils.addListItem(SERVER_RESPONSES, "  openClose=" & order.openClose)
    Call m_utils.addListItem(SERVER_RESPONSES, "  origin=" & order.origin)
    Call m_utils.addListItem(SERVER_RESPONSES, "  shortSaleSlot=" & order.shortSaleSlot)
    Call m_utils.addListItem(SERVER_RESPONSES, "  designatedLocation=" & order.designatedLocation)
    Call m_utils.addListItem(SERVER_RESPONSES, "  exemptCode=" & order.exemptCode)

    ' SMART routing only
    Call m_utils.addListItem(SERVER_RESPONSES, "  discretionaryAmt=" & order.discretionaryAmt)
    Call m_utils.addListItem(SERVER_RESPONSES, "  eTradeOnly=" & order.eTradeOnly)
    Call m_utils.addListItem(SERVER_RESPONSES, "  firmQuoteOnly=" & order.firmQuoteOnly)
    Call m_utils.addListItem(SERVER_RESPONSES, "  nbboPriceCap=" & DblMaxStr(order.nbboPriceCap))
    Call m_utils.addListItem(SERVER_RESPONSES, "  optOutSmartRouting=" & order.optOutSmartRouting)

    ' BOX or VOL orders only
    Call m_utils.addListItem(SERVER_RESPONSES, "  auctionStrategy=" & order.auctionStrategy)

    ' BOX order only
    Call m_utils.addListItem(SERVER_RESPONSES, "  startingPrice=" & DblMaxStr(order.startingPrice))
    Call m_utils.addListItem(SERVER_RESPONSES, "  stockRefPrice=" & DblMaxStr(order.stockRefPrice))
    Call m_utils.addListItem(SERVER_RESPONSES, "  delta=" & DblMaxStr(order.delta))

    ' pegged to stock or VOL orders
    Call m_utils.addListItem(SERVER_RESPONSES, "  stockRangeLower=" & DblMaxStr(order.stockRangeLower))
    Call m_utils.addListItem(SERVER_RESPONSES, "  stockRangeUpper=" & DblMaxStr(order.stockRangeUpper))

    ' VOLATILITY orders only
    Call m_utils.addListItem(SERVER_RESPONSES, "  volatility=" & DblMaxStr(order.volatility))
    Call m_utils.addListItem(SERVER_RESPONSES, "  volatilityType=" & order.volatilityType)
    Call m_utils.addListItem(SERVER_RESPONSES, "  continuousUpdate=" & order.continuousUpdate)
    Call m_utils.addListItem(SERVER_RESPONSES, "  referencePriceType=" & order.referencePriceType)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralOrderType=" & order.deltaNeutralOrderType)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralAuxPrice=" & DblMaxStr(order.deltaNeutralAuxPrice))
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralConId=" & order.deltaNeutralConId)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralSettlingFirm=" & order.deltaNeutralSettlingFirm)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralClearingAccount=" & order.deltaNeutralClearingAccount)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralClearingIntent=" & order.deltaNeutralClearingIntent)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralOpenClose=" & order.deltaNeutralOpenClose)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralShortSale=" & order.deltaNeutralShortSale)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralShortSaleSlot=" & order.deltaNeutralShortSaleSlot)
    Call m_utils.addListItem(SERVER_RESPONSES, "  deltaNeutralDesignatedLocation=" & order.deltaNeutralDesignatedLocation)

    ' COMBO orders only
    Call m_utils.addListItem(SERVER_RESPONSES, "  basisPoints=" & DblMaxStr(order.basisPoints))
    Call m_utils.addListItem(SERVER_RESPONSES, "  basisPointsType=" & LongMaxStr(order.basisPointsType))

    ' SCALE orders only
    Call m_utils.addListItem(SERVER_RESPONSES, "  scaleInitLevelSize=" & LongMaxStr(order.scaleInitLevelSize))
    Call m_utils.addListItem(SERVER_RESPONSES, "  scaleSubsLevelSize=" & LongMaxStr(order.scaleSubsLevelSize))
    Call m_utils.addListItem(SERVER_RESPONSES, "  scalePriceIncrement=" & DblMaxStr(order.scalePriceIncrement))
    Call m_utils.addListItem(SERVER_RESPONSES, "  scalePriceAdjustValue=" & DblMaxStr(order.scalePriceAdjustValue))
    Call m_utils.addListItem(SERVER_RESPONSES, "  scalePriceAdjustInterval=" & LongMaxStr(order.scalePriceAdjustInterval))
    Call m_utils.addListItem(SERVER_RESPONSES, "  scaleProfitOffset=" & DblMaxStr(order.scaleProfitOffset))
    Call m_utils.addListItem(SERVER_RESPONSES, "  scaleAutoReset=" & order.scaleAutoReset)
    Call m_utils.addListItem(SERVER_RESPONSES, "  scaleInitPosition=" & LongMaxStr(order.scaleInitPosition))
    Call m_utils.addListItem(SERVER_RESPONSES, "  scaleInitFillQty=" & LongMaxStr(order.scaleInitFillQty))
    Call m_utils.addListItem(SERVER_RESPONSES, "  scaleRandomPercent=" & order.scaleRandomPercent)
    
    ' HEDGE orders only
    Call m_utils.addListItem(SERVER_RESPONSES, "  hedgeType=" & order.hedgeType)
    Call m_utils.addListItem(SERVER_RESPONSES, "  hedgeParam=" & order.hedgeParam)
    
    ' ALGO orders only
    Dim algoStrategy As String
    Let algoStrategy = order.algoStrategy
    If (algoStrategy <> "") Then
        Call m_utils.addListItem(SERVER_RESPONSES, "  algoStrategy=" & algoStrategy)
        Call m_utils.addListItem(SERVER_RESPONSES, "  algoParams={")
        Dim algoParams As TWSLib.ITagValueList
        Set algoParams = order.algoParams
        If (Not algoParams Is Nothing) Then
            Dim algoParamsCount As Long
            algoParamsCount = algoParams.Count
            For iLoop = 0 To algoParamsCount - 1
                Dim param As TWSLib.ITagValue
                Set param = algoParams.Item(iLoop)
                Call m_utils.addListItem(SERVER_RESPONSES, "    " & param.tag & "=" & param.value)
            Next iLoop
        End If
        Call m_utils.addListItem(SERVER_RESPONSES, "  }")
    End If
    
    ' Smart combo routing params
    Call m_utils.addListItem(SERVER_RESPONSES, "  smartComboRoutingParams={")
    Dim smartComboRoutingParams As TWSLib.ITagValueList
    Set smartComboRoutingParams = order.smartComboRoutingParams
    If (Not smartComboRoutingParams Is Nothing) Then
        Dim smartComboRoutingParamsCount As Long
        smartComboRoutingParamsCount = smartComboRoutingParams.Count
        Dim iLoop1 As Long
        For iLoop1 = 0 To smartComboRoutingParamsCount - 1
            Dim param1 As TWSLib.ITagValue
            Set param1 = smartComboRoutingParams.Item(iLoop1)
            Call m_utils.addListItem(SERVER_RESPONSES, "    " & param1.tag & "=" & param1.value)
        Next iLoop1
    End If
    Call m_utils.addListItem(SERVER_RESPONSES, "  }")
    
    Call m_utils.addListItem(SERVER_RESPONSES, "OrderState:")
    Call m_utils.addListItem(SERVER_RESPONSES, "  status=" & orderState.status)
    Call m_utils.addListItem(SERVER_RESPONSES, "  initMargin=" & orderState.initMargin)
    Call m_utils.addListItem(SERVER_RESPONSES, "  maintMargin=" & orderState.maintMargin)
    Call m_utils.addListItem(SERVER_RESPONSES, "  equityWithLoan=" & orderState.equityWithLoan)
    Call m_utils.addListItem(SERVER_RESPONSES, "  commission=" & DblMaxStr(orderState.commission))
    Call m_utils.addListItem(SERVER_RESPONSES, "  minCommission=" & DblMaxStr(orderState.minCommission))
    Call m_utils.addListItem(SERVER_RESPONSES, "  maxCommission=" & DblMaxStr(orderState.maxCommission))
    Call m_utils.addListItem(SERVER_RESPONSES, "  comissionCurrency=" & orderState.commissionCurrency)
    Call m_utils.addListItem(SERVER_RESPONSES, "  warningText=" & orderState.warningText)
    
    Call m_utils.addListItem(SERVER_RESPONSES, "===============================")
End Sub
Private Sub Tws1_openOrderEnd()

    Call m_utils.addListItem(SERVER_RESPONSES, "============= end =============")
    
    ' move into view
    lstServerResponses.TopIndex = lstServerResponses.ListCount - 1
    
End Sub

Private Sub Tws1_deltaNeutralValidation(ByVal reqId As Long, ByVal underComp As TWSLib.IUnderComp)

    Call m_utils.addListItem(SERVER_RESPONSES, "deltaNeutralValidation called, reqId=" & reqId)
    
    If (Not underComp Is Nothing) Then
        With underComp
            Call m_utils.addListItem(SERVER_RESPONSES, "  underComp.conId=" & .conId)
            Call m_utils.addListItem(SERVER_RESPONSES, "  underComp.delta=" & .delta)
            Call m_utils.addListItem(SERVER_RESPONSES, "  underComp.delta=" & .price)
        End With
    End If
    
End Sub

Private Sub Tws1_tickSnapshotEnd(ByVal reqId As Long)

    Call m_utils.addListItem(MKT_DATA, "id=" & reqId & " =============== end ===============")

    ' move into view
    lstServerResponses.TopIndex = lstServerResponses.ListCount - 1
    
End Sub

'--------------------------------------------------------------------------------
' Notification of an updated/new portfolio position - triggered by the reqAcctUpdates() method
'--------------------------------------------------------------------------------
Private Sub Tws1_updatePortfolioEx(ByVal contract As TWSLib.IContract, ByVal Position As Long, _
        ByVal marketPrice As Double, ByVal marketValue As Double, ByVal averageCost As Double, _
        ByVal unrealizedPNL As Double, ByVal realizedPNL As Double, ByVal accountName As String)
        
    m_dlgAcctData.updatePortfolio contract, Position, marketPrice, marketValue, _
                                  averageCost, unrealizedPNL, realizedPNL, accountName
End Sub

'--------------------------------------------------------------------------------
' Notification of a server time update - triggered by the reqAcctUpdates() method
'--------------------------------------------------------------------------------
Private Sub Tws1_updateAccountTime(ByVal timeStamp As String)
    m_dlgAcctData.updateAccountTime timeStamp
End Sub

'--------------------------------------------------------------------------------
' Notification of an account proprty update - triggered by the reqAcctUpdates() method
'--------------------------------------------------------------------------------
Private Sub Tws1_updateAccountValue(ByVal key As String, ByVal value As String, _
    ByVal curency As String, ByVal accountName As String)
    m_dlgAcctData.updateAccountValue key, value, curency, accountName
End Sub

Private Sub Tws1_accountDownloadEnd(ByVal accountName As String)
    m_dlgAcctData.accountDownloadEnd (accountName)
    Call m_utils.addListItem(SERVER_RESPONSES, "Account Download End:" & accountName)
End Sub

'--------------------------------------------------------------------------------
' An order execution report. This event is triggered by the explicit request for
' execution reports reqExecutionDetails(), and also by order state changes method
'--------------------------------------------------------------------------------
Private Sub Tws1_execDetailsEx(ByVal reqId As Long, ByVal contract As TWSLib.IContract, _
                               ByVal execution As TWSLib.IExecution)

    Dim offset As Long
    offset = lstServerResponses.ListCount
    
    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Execution Details begin ----")

    Call m_utils.addListItem(SERVER_RESPONSES, "reqId = " & reqId)

    Call m_utils.addListItem(SERVER_RESPONSES, "Contract:")
    With contract
    
        Call m_utils.addListItem(SERVER_RESPONSES, "  conId=" & .conId)
        Call m_utils.addListItem(SERVER_RESPONSES, "  symbol=" & .symbol)
        Call m_utils.addListItem(SERVER_RESPONSES, "  secType=" & .secType)
        Call m_utils.addListItem(SERVER_RESPONSES, "  expiry=" & .expiry)
        Call m_utils.addListItem(SERVER_RESPONSES, "  strike=" & .strike)
        Call m_utils.addListItem(SERVER_RESPONSES, "  right=" & .Right)
        Call m_utils.addListItem(SERVER_RESPONSES, "  multiplier=" & .multiplier)
        Call m_utils.addListItem(SERVER_RESPONSES, "  exchange=" & .exchange)
        Call m_utils.addListItem(SERVER_RESPONSES, "  primaryExchange=" & .primaryExchange)
        Call m_utils.addListItem(SERVER_RESPONSES, "  currency=" & .Currency)
        Call m_utils.addListItem(SERVER_RESPONSES, "  localSymbol=" & .localSymbol)
        Call m_utils.addListItem(SERVER_RESPONSES, "  tradingClass=" & .tradingClass)
        
    End With

    Call m_utils.addListItem(SERVER_RESPONSES, "Execution:")
    With execution
    
        Call m_utils.addListItem(SERVER_RESPONSES, "  execId = " & .execId)
        Call m_utils.addListItem(SERVER_RESPONSES, "  orderId = " & .orderId)
        Call m_utils.addListItem(SERVER_RESPONSES, "  clientId = " & .clientId)
        Call m_utils.addListItem(SERVER_RESPONSES, "  permId = " & .permId)
        Call m_utils.addListItem(SERVER_RESPONSES, "  time = " & .time)
        Call m_utils.addListItem(SERVER_RESPONSES, "  acctNumber = " & .acctNumber)
        Call m_utils.addListItem(SERVER_RESPONSES, "  exchange = " & .exchange)
        Call m_utils.addListItem(SERVER_RESPONSES, "  side = " & .side)
        Call m_utils.addListItem(SERVER_RESPONSES, "  shares = " & .shares)
        Call m_utils.addListItem(SERVER_RESPONSES, "  price = " & .price)
        Call m_utils.addListItem(SERVER_RESPONSES, "  liquidation = " & .liquidation)
        Call m_utils.addListItem(SERVER_RESPONSES, "  cumQty = " & .cumQty)
        Call m_utils.addListItem(SERVER_RESPONSES, "  avgPrice = " & .avgPrice)
        Call m_utils.addListItem(SERVER_RESPONSES, "  orderRef = " & .orderRef)
        Call m_utils.addListItem(SERVER_RESPONSES, "  evRule = " & .evRule)
        Call m_utils.addListItem(SERVER_RESPONSES, "  evMultiplier = " & .evMultiplier)
        
    End With
        
    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Execution Details End ----")

    ' move into view
    lstServerResponses.TopIndex = offset

End Sub
Private Sub Tws1_execDetailsEnd(ByVal reqId As Long)

    Call m_utils.addListItem(SERVER_RESPONSES, "reqId = " & reqId & " =============== end ===============")

    ' move into view
    lstServerResponses.TopIndex = lstServerResponses.ListCount - 1
    
End Sub

'--------------------------------------------------------------------------------
' Notification of a new IB news bulletin
'--------------------------------------------------------------------------------
Private Sub Tws1_updateNewsBulletin(ByVal msgId As Integer, ByVal msgType As Integer, _
        ByVal message As String, ByVal origExchange As String)
    Dim msg As String
    Dim dlg As New dlgServerResponse
    msg = " MsgId=" & msgId & " :: MsgType=" & msgType & " :: Origin=" & origExchange & " :: Message=" & message
    
    dlg.Caption = "IB News Bulletin"
    dlg.lblMsg.Caption = msg
    dlg.Show
End Sub

'--------------------------------------------------------------------------------
' Notification of the FA managed accounts (comma delimited list of account codes)
'--------------------------------------------------------------------------------
Private Sub Tws1_managedAccounts(ByVal accountsList As String)
    Dim msg As String
    
    msg = "Connected : The list of managed accounts are : [" & accountsList & "]"
    Call m_utils.addListItem(SERVER_RESPONSES, msg)
    
    m_faAccount = True
    m_faAcctsList = accountsList
    
End Sub
Private Sub Tws1_receiveFA(ByVal faDataType As FA_Message_Type, ByVal xml As String)
    Dim fname As String
    
    fname = m_utils.faMsgTypeName(faDataType)
    Call m_utils.addListItem(SERVER_RESPONSES, "FA: " & fname & "=" & xml)
    Select Case faDataType
        Case GROUPS:
          faGroupXML = xml
        Case PROFILES:
          faProfilesXML = xml
        Case ALIASES:
          faAliasesXML = xml
    End Select

    If faError = False And _
        faGroupXML <> "" And faProfilesXML <> "" And faAliasesXML <> "" Then
        m_dlgFinancialAdvisor.init m_utils, faGroupXML, faProfilesXML, faAliasesXML
        m_dlgFinancialAdvisor.Show vbModal
        If m_dlgFinancialAdvisor.ok Then
            Call Tws1.replaceFA(GROUPS, m_dlgFinancialAdvisor.groupsXML)
            Call Tws1.replaceFA(PROFILES, m_dlgFinancialAdvisor.profilesXML)
            Call Tws1.replaceFA(ALIASES, m_dlgFinancialAdvisor.aliasesXML)
        End If
    End If
End Sub

'--------------------------------------------------------------------------------
' Market Data Type
'--------------------------------------------------------------------------------
Private Sub Tws1_marketDataType(ByVal reqId As Long, ByVal marketDataType As Long)
    Dim msg As String

    Select Case marketDataType
        Case MARKET_DATA_TYPE.REALTIME
            msg = "id=" & reqId & " marketDataType = Real-Time"
        Case MARKET_DATA_TYPE.FROZEN
            msg = "id=" & reqId & " marketDataType = Frozen"
        Case Else
            msg = "id=" & reqId & " marketDataType = Unknown"
    End Select
	
    Call m_utils.addListItem(MKT_DATA, msg)
End Sub

'--------------------------------------------------------------------------
' Commission Report
'--------------------------------------------------------------------------------
Private Sub Tws1_commissionReport(ByVal commissionReport As TWSLib.ICommissionReport)

    Dim offset As Long
    offset = lstServerResponses.ListCount

    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Commission Report ----")

    With commissionReport
        Call m_utils.addListItem(SERVER_RESPONSES, "  execId=" & .execId)
        Call m_utils.addListItem(SERVER_RESPONSES, "  commission=" & DblMaxStr(.commission))
        Call m_utils.addListItem(SERVER_RESPONSES, "  currency=" & .currency)
        Call m_utils.addListItem(SERVER_RESPONSES, "  realizedPNL=" & DblMaxStr(.realizedPNL))
        Call m_utils.addListItem(SERVER_RESPONSES, "  yield=" & DblMaxStr(.yield))
        Call m_utils.addListItem(SERVER_RESPONSES, "  yieldRedemptionDate=" & LongMaxStr(.yieldRedemptionDate))
	End With

    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Commission Report End ----")

    ' move into view
    lstServerResponses.TopIndex = offset
End Sub

'--------------------------------------------------------------------------------
' Position
'--------------------------------------------------------------------------------
Private Sub Tws1_position(ByVal account As String, ByVal contract As TWSLib.IContract, ByVal position As Long, ByVal avgCost As Double)

    Dim offset As Long
    offset = lstServerResponses.ListCount

    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Position ----")
    Call m_utils.addListItem(SERVER_RESPONSES, "  account=" & account)
    Call m_utils.addListItem(SERVER_RESPONSES, "  Contract:")

    With contract
        Call m_utils.addListItem(SERVER_RESPONSES, "    conId=" & .conId)
        Call m_utils.addListItem(SERVER_RESPONSES, "    symbol=" & .symbol)
        Call m_utils.addListItem(SERVER_RESPONSES, "    secType=" & .secType)
        Call m_utils.addListItem(SERVER_RESPONSES, "    expiry=" & .expiry)
        Call m_utils.addListItem(SERVER_RESPONSES, "    strike=" & .strike)
        Call m_utils.addListItem(SERVER_RESPONSES, "    right=" & .right)
        Call m_utils.addListItem(SERVER_RESPONSES, "    multiplier=" & .multiplier)
        Call m_utils.addListItem(SERVER_RESPONSES, "    exchange=" & .exchange)
        Call m_utils.addListItem(SERVER_RESPONSES, "    primaryExchange=" & .primaryExchange)
        Call m_utils.addListItem(SERVER_RESPONSES, "    currency=" & .currency)
        Call m_utils.addListItem(SERVER_RESPONSES, "    localSymbol=" & .localSymbol)
        Call m_utils.addListItem(SERVER_RESPONSES, "    tradingClass=" & .tradingClass)
    End With

    Call m_utils.addListItem(SERVER_RESPONSES, "  position=" & LongMaxStr(position))
    Call m_utils.addListItem(SERVER_RESPONSES, "  avgCost=" & DblMaxStr(avgCost))
    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Position End ----")

    ' move into view
    lstServerResponses.TopIndex = offset

End Sub

'--------------------------------------------------------------------------------
' Position End
'--------------------------------------------------------------------------------
Private Sub Tws1_positionEnd()
    Call m_utils.addListItem(SERVER_RESPONSES, " ==== Position End ==== ")

    ' move into view
    lstServerResponses.TopIndex = lstServerResponses.ListCount - 1
End Sub

'--------------------------------------------------------------------------------
' Account Summary
'--------------------------------------------------------------------------------
Private Sub Tws1_accountSummary(ByVal reqId As Long, ByVal account As String, ByVal tag As String, ByVal value As String, ByVal curency As String)

    Dim offset As Long
    offset = lstServerResponses.ListCount

    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Account Summary ----")
    Call m_utils.addListItem(SERVER_RESPONSES, "reqId=" & reqId)
    Call m_utils.addListItem(SERVER_RESPONSES, "account=" & account)
    Call m_utils.addListItem(SERVER_RESPONSES, "tag=" & tag)
    Call m_utils.addListItem(SERVER_RESPONSES, "value=" & value)
    Call m_utils.addListItem(SERVER_RESPONSES, "currency=" & curency)
    Call m_utils.addListItem(SERVER_RESPONSES, " ---- Account Summary End ----")

    ' move into view
    lstServerResponses.TopIndex = offset
End Sub

'--------------------------------------------------------------------------------
' Account Summary End
'--------------------------------------------------------------------------------
Private Sub Tws1_accountSummaryEnd(ByVal reqId As Long)

    Call m_utils.addListItem(SERVER_RESPONSES, "reqId = " & reqId & " =============== end ===============")

    ' move into view
    lstServerResponses.TopIndex = lstServerResponses.ListCount - 1

End Sub
'================================================================================
' Private Methods
'================================================================================
Private Sub Form_Load()

    Call m_utils.init(Me, m_dlgAcctData)
    Call m_dlgAcctData.init(m_utils)
    Call m_dlgScanner.init(Me)

    faErrorCodes(0) = 503
    faErrorCodes(1) = 504
    faErrorCodes(2) = 505
    faErrorCodes(3) = 522
    faErrorCodes(4) = 1100
    faErrorCodes(5) = 321
    m_maxLong = Tws1.minQty
    m_maxDouble = Tws1.nbboPriceCap
    
    Set m_contractInfo = Tws1.createContract()
    Set m_orderInfo = Tws1.createOrder()
    Set m_execFilter = Tws1.createExecutionFilter()
    Set m_underComp = Tws1.createUnderComp()

End Sub

'================================================================================
' XML Utilities
'================================================================================
Function ProduceXMLDoc() As DOMDocument50
    Dim xmlDoc As DOMDocument50
    Set xmlDoc = New DOMDocument50
    xmlDoc.async = False
    xmlDoc.validateOnParse = False
    xmlDoc.resolveExternals = False
    Set ProduceXMLDoc = xmlDoc
End Function
Public Function parseNode(ByVal node As IXMLDOMNode, _
                           ByVal nodeName As String) As String
    Dim subNode As IXMLDOMNode
    Set subNode = node.selectSingleNode(nodeName)
    parseNode = subNode.nodeTypedValue
End Function

Public Function PopulateXMLDoc(ByVal xmlDoc As DOMDocument50, ByVal rootName As String) _
    As IXMLDOMElement
    
    Rem this application doesn't need the Processing instruction
    Rem Dim node As IXMLDOMNode
    Rem Set node = xmlDoc.createProcessingInstruction("xml", "version='1.0'")
    Rem xmlDoc.appendChild node
    Rem Set node = Nothing
    
    Dim rootNode
    Set rootNode = xmlDoc.createElement(rootName)
    xmlDoc.appendChild rootNode
    AppendNewLineAndTab xmlDoc, rootNode
    Set PopulateXMLDoc = rootNode
End Function
Public Sub AppendNewLineAndTab(ByVal xmlDoc As DOMDocument50, ByVal node As IXMLDOMNode)
    node.appendChild xmlDoc.createTextNode(vbNewLine + vbTab)
End Sub
Public Sub AppendNewLine(ByVal xmlDoc As DOMDocument50, ByVal node As IXMLDOMNode)
    node.appendChild xmlDoc.createTextNode(vbNewLine)
End Sub
Public Sub SetElemAttr(ByVal xmlDoc As DOMDocument50, ByVal elem As IXMLDOMElement, _
                       ByVal attrName As String, ByVal attrValue As String)
    Dim attr
    Set attr = xmlDoc.createAttribute(attrName)
    attr.value = attrValue
    elem.setAttributeNode attr
    Set attr = Nothing
End Sub
Public Function AddNodeToXMLDoc(ByVal xmlDoc As DOMDocument50, _
                                ByVal node As IXMLDOMElement, ByVal nodeName As String, _
                                Optional ByVal nodeValue As String) As IXMLDOMNode
    Dim newNode
    Set newNode = xmlDoc.createElement(nodeName)
    If Not IsMissing(nodeValue) Then
        newNode.text = nodeValue
    End If
    node.appendChild newNode
    Set AddNodeToXMLDoc = newNode
End Function
Private Function LongMaxStr(ByRef longVal As Long) As String
    If longVal = m_maxLong Then
        LongMaxStr = ""
    Else
        LongMaxStr = CStr(longVal)
    End If
End Function
Private Function DblMaxStr(ByRef dblVal As Double) As String
    If dblVal = m_maxDouble Then
        DblMaxStr = ""
    Else
        DblMaxStr = CStr(dblVal)
    End If
End Function
