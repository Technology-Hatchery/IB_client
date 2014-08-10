' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgOrder 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Request Market Data"
   ClientHeight    =   11790
   ClientLeft      =   -990
   ClientTop       =   1725
   ClientWidth     =   6900
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   11790
   ScaleWidth      =   6900
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdSmartComboRoutingParams 
      Caption         =   "Cmb Rout Params"
      Height          =   375
      Left            =   3600
      TabIndex        =   84
      Top             =   5280
      Width           =   1455
   End
   Begin VB.Frame frameMarketDataType 
      Caption         =   "Market Data Type"
      Height          =   615
      Left            =   3480
      TabIndex        =   79
      Top             =   10560
      Width           =   3135
      Begin VB.ComboBox cmbMarketDataType
         Height          =   315
         Left            =   1680
		 Style           =   2  ' Dropdown List
         TabIndex        =   81
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label31 
         Caption         =   "Mkt Data Type"
         Height          =   255
         Left            =   240
         TabIndex        =   80
         Top             =   240
         Width           =   1200
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Market Depth"
      Height          =   855
      Left            =   240
      TabIndex        =   33
      Top             =   7560
      Width           =   3135
      Begin VB.TextBox txtMktDepth 
         Height          =   285
         Left            =   1680
         TabIndex        =   35
         Text            =   "20"
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label29 
         Caption         =   "Max Market Depth Rows"
         Height          =   375
         Left            =   240
         TabIndex        =   34
         Top             =   320
         Width           =   1200
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Exercise Options"
      Height          =   2295
      Left            =   240
      TabIndex        =   36
      Top             =   8520
      Width           =   3135
      Begin VB.TextBox txtExerciseQuantity 
         Height          =   285
         Left            =   1695
         TabIndex        =   40
         Text            =   "1"
         Top             =   840
         Width           =   1215
      End
      Begin VB.TextBox txtExerciseOverride 
         Height          =   285
         Left            =   1695
         TabIndex        =   42
         Text            =   "0"
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox txtExerciseAction 
         Height          =   285
         Left            =   1695
         TabIndex        =   38
         Text            =   "1"
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label28 
         Caption         =   "Quantity"
         Height          =   255
         Left            =   240
         TabIndex        =   39
         Top             =   840
         Width           =   1095
      End
      Begin VB.Label Label27 
         Caption         =   "Override (0 or 1)"
         Height          =   255
         Left            =   240
         TabIndex        =   41
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Label Label26 
         Caption         =   "Action (1 or 2)"
         Height          =   375
         Left            =   240
         TabIndex        =   37
         Top             =   360
         Width           =   1350
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Market Data"
      Height          =   975
      Left            =   3480
      TabIndex        =   62
      Top             =   6120
      Width           =   3255
      Begin VB.CheckBox chkSnapshotMktData 
         Caption         =   "Snapshot"
         Height          =   255
         Left            =   120
         TabIndex        =   65
         Top             =   600
         Width           =   1335
      End
      Begin VB.TextBox txtGenericTickTags 
         Height          =   285
         Left            =   1680
         TabIndex        =   64
         Text            =   "100,101,104,105,106,107,165,221,225,233,236,258,293,294,295,318"
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label22 
         Caption         =   "Generic Tick Tags"
         Height          =   255
         Left            =   120
         TabIndex        =   63
         Top             =   240
         Width           =   1440
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Historical Data"
      Height          =   3255
      Left            =   3480
      TabIndex        =   65
      Top             =   7200
      Width           =   3255
      Begin VB.TextBox txtBarSizeSetting 
         Height          =   285
         Left            =   1335
         TabIndex        =   72
         Text            =   "1 day"
         Top             =   1320
         Width           =   1800
      End
      Begin VB.TextBox txtEndDateTime 
         Height          =   285
         Left            =   1335
         TabIndex        =   68
         Text            =   "YYYYMMDD hh:mm:ss"
         Top             =   360
         Width           =   1800
      End
      Begin VB.TextBox txtFormatDate 
         Height          =   285
         Left            =   1320
         TabIndex        =   78
         Text            =   "1"
         Top             =   2775
         Width           =   1815
      End
      Begin VB.TextBox txtUseRTH 
         Height          =   285
         Left            =   1320
         TabIndex        =   76
         Text            =   "1"
         Top             =   2295
         Width           =   1815
      End
      Begin VB.TextBox txtWhatToShow 
         Height          =   285
         Left            =   1320
         TabIndex        =   74
         Text            =   "TRADES"
         Top             =   1800
         Width           =   1815
      End
      Begin VB.TextBox txtDuration 
         Height          =   285
         Left            =   1320
         TabIndex        =   70
         Text            =   "1 M"
         Top             =   840
         Width           =   1815
      End
      Begin VB.Label Label24 
         Caption         =   "Bar Size Setting"
         Height          =   255
         Left            =   120
         TabIndex        =   71
         Top             =   1320
         Width           =   1200
      End
      Begin VB.Label Label23 
         Caption         =   "End Date/Time"
         Height          =   255
         Left            =   120
         TabIndex        =   67
         Top             =   360
         Width           =   1320
      End
      Begin VB.Label Label21 
         Caption         =   "Date Format Style (1 or 2)"
         Height          =   375
         Left            =   120
         TabIndex        =   77
         Top             =   2730
         Width           =   1080
      End
      Begin VB.Label Label20 
         Caption         =   "Regular Trading Hours (1 or 0)"
         Height          =   375
         Left            =   120
         TabIndex        =   75
         Top             =   2230
         Width           =   1200
      End
      Begin VB.Label Label19 
         Caption         =   "What to Show"
         Height          =   255
         Left            =   120
         TabIndex        =   73
         Top             =   1800
         Width           =   1200
      End
      Begin VB.Label Label25 
         Caption         =   "Query Duration"
         Height          =   255
         Left            =   120
         TabIndex        =   69
         Top             =   840
         Width           =   1080
      End
   End
   Begin VB.CommandButton cmdSetShareAllocation 
      Caption         =   "FA Alloc"
      Height          =   375
      Left            =   3600
      TabIndex        =   57
      Top             =   4320
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3720
      TabIndex        =   83
      Top             =   11280
      Width           =   1095
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   2040
      TabIndex        =   82
      Top             =   11280
      Width           =   1095
   End
   Begin VB.Frame frameOrderDesc 
      Caption         =   "Order Description"
      Height          =   5415
      Left            =   3480
      TabIndex        =   43
      Top             =   600
      Width           =   3255
      Begin VB.CommandButton cmdAlgoParams 
         Caption         =   "Algo Params"
         Height          =   375
         Left            =   1680
         TabIndex        =   61
         Top             =   4200
         Width           =   1455
      End
      Begin VB.CommandButton cmdUnderComp 
         Caption         =   "Delta Neutral"
         Height          =   375
         Left            =   120
         TabIndex        =   60
         Top             =   4200
         Width           =   1455
      End
      Begin VB.TextBox tGAT 
         Height          =   285
         Left            =   1485
         TabIndex        =   55
         Top             =   2760
         Width           =   1695
      End
      Begin VB.TextBox tGTD 
         Height          =   285
         Left            =   1485
         TabIndex        =   57
         Top             =   3240
         Width           =   1695
      End
      Begin VB.CommandButton cmdAddCmboLegs 
         Caption         =   "Combo Legs"
         Height          =   375
         Left            =   1680
         TabIndex        =   59
         Top             =   3720
         Width           =   1455
      End
      Begin VB.TextBox txtAuxPrice 
         Height          =   285
         Left            =   1485
         TabIndex        =   53
         Text            =   "0"
         Top             =   2280
         Width           =   1695
      End
      Begin VB.TextBox txtLmtPrice 
         Height          =   285
         Left            =   1485
         TabIndex        =   51
         Text            =   "40"
         Top             =   1800
         Width           =   1695
      End
      Begin VB.TextBox txtOrderType 
         Height          =   285
         Left            =   1485
         TabIndex        =   49
         Text            =   "LMT"
         Top             =   1320
         Width           =   1695
      End
      Begin VB.TextBox txtQuantity 
         Height          =   285
         Left            =   1485
         TabIndex        =   47
         Text            =   "10"
         Top             =   840
         Width           =   1695
      End
      Begin VB.TextBox txtAction 
         Height          =   285
         Left            =   1485
         TabIndex        =   45
         Text            =   "BUY"
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label Label16 
         Caption         =   "Good After Time"
         Height          =   375
         Left            =   220
         TabIndex        =   54
         Top             =   2760
         Width           =   1200
      End
      Begin VB.Label Label15 
         Caption         =   "Good Till Date"
         Height          =   255
         Left            =   220
         TabIndex        =   56
         Top             =   3240
         Width           =   1200
      End
      Begin VB.Label Label14 
         Caption         =   "Aux/Under Price"
         Height          =   255
         Left            =   220
         TabIndex        =   52
         Top             =   2280
         Width           =   1200
      End
      Begin VB.Label Label13 
         Caption         =   "Lmt/Opt Price / Volatility"
         Height          =   495
         Left            =   220
         TabIndex        =   50
         Top             =   1680
         Width           =   1200
      End
      Begin VB.Label Label12 
         Caption         =   "Order Type"
         Height          =   255
         Left            =   220
         TabIndex        =   48
         Top             =   1320
         Width           =   1200
      End
      Begin VB.Label Label11 
         Caption         =   "Quantity"
         Height          =   255
         Left            =   220
         TabIndex        =   46
         Top             =   840
         Width           =   1200
      End
      Begin VB.Label Label10 
         Caption         =   "Action"
         Height          =   255
         Left            =   220
         TabIndex        =   44
         Top             =   360
         Width           =   1200
      End
   End
   Begin VB.Frame frameTickerDesc 
      Caption         =   "Contract Description"
      Height          =   6955
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   3135
      Begin VB.TextBox txtConId 
         Height          =   285
         Left            =   1680
         TabIndex        =   4
         Text            =   "0"
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox txtSecIdType 
         Height          =   285
         Left            =   1680
         TabIndex        =   30
         Top             =   5640
         Width           =   1215
      End
      Begin VB.TextBox txtSecId
         Height          =   285
         Left            =   1680
         TabIndex        =   32
         Top             =   6040
         Width           =   1215
      End
      Begin VB.TextBox txtTradingClass 
         Height          =   285
         Left            =   1695
         TabIndex        =   26
         Top             =   4760
         Width           =   1215
      End
      Begin VB.TextBox txtIsExpired 
         Height          =   285
         Left            =   1695
         TabIndex        =   28
         Text            =   "0"
         Top             =   5240
         Width           =   1215
      End
      Begin VB.TextBox TextMultiplier 
         Height          =   285
         Left            =   1680
         TabIndex        =   16
         Top             =   2760
         Width           =   1215
      End
      Begin VB.TextBox TxtPrimaryExchange 
         Height          =   285
         Left            =   1680
         TabIndex        =   20
         Top             =   3560
         Width           =   1215
      End
      Begin VB.TextBox txtRight 
         Height          =   285
         Left            =   1680
         TabIndex        =   14
         Top             =   2360
         Width           =   1215
      End
      Begin VB.TextBox txtLocalSymbol 
         Height          =   285
         Left            =   1680
         TabIndex        =   24
         Top             =   4360
         Width           =   1215
      End
      Begin VB.TextBox txtCurrency 
         Height          =   285
         Left            =   1680
         TabIndex        =   22
         Text            =   "USD"
         Top             =   3960
         Width           =   1215
      End
      Begin VB.TextBox txtExchange 
         Height          =   285
         Left            =   1680
         TabIndex        =   18
         Text            =   "SMART"
         Top             =   3160
         Width           =   1215
      End
      Begin VB.TextBox txtStrike 
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
         Height          =   285
         Left            =   1680
         TabIndex        =   12
         Text            =   "0"
         Top             =   1960
         Width           =   1215
      End
      Begin VB.TextBox txtExpiry 
         Height          =   285
         Left            =   1680
         TabIndex        =   10
         Top             =   1560
         Width           =   1215
      End
      Begin VB.TextBox txtSecType 
         Height          =   285
         Left            =   1680
         TabIndex        =   8
         Text            =   "STK"
         Top             =   1160
         Width           =   1215
      End
      Begin VB.TextBox txtSymbol 
         Height          =   285
         Left            =   1680
         TabIndex        =   6
         Text            =   "QQQQ"
         Top             =   760
         Width           =   1215
      End
      Begin VB.Label LabelConId 
         Caption         =   "Contract Id"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label LabelSecIdType 
         Caption         =   "Sec Id Type"
         Height          =   255
         Left            =   240
         TabIndex        =   29
         Top             =   5640
         Width           =   1295
      End
      Begin VB.Label LabelSecId 
         Caption         =   "Sec Id"
         Height          =   255
         Left            =   240
         TabIndex        =   31
         Top             =   6040
         Width           =   1295
      End
      Begin VB.Label LabelTradingClass 
         Caption         =   "Trading Class"
         Height          =   255
         Left            =   240
         TabIndex        =   25
         Top             =   4760
         Width           =   1095
      End
      Begin VB.Label Label30 
         Caption         =   "Include Expired"
         Height          =   255
         Left            =   240
         TabIndex        =   27
         Top             =   5240
         Width           =   1095
      End
      Begin VB.Label Label18 
         Caption         =   "Multiplier"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   2760
         Width           =   1095
      End
      Begin VB.Label Label17 
         Caption         =   "Primary Exchange"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   3560
         Width           =   1455
      End
      Begin VB.Label Label9 
         Caption         =   "Right"
         Height          =   255
         Left            =   225
         TabIndex        =   13
         Top             =   2360
         Width           =   1095
      End
      Begin VB.Label Label8 
         Caption         =   "Local Symbol"
         Height          =   255
         Left            =   225
         TabIndex        =   23
         Top             =   4360
         Width           =   1095
      End
      Begin VB.Label Label7 
         Caption         =   "Currency"
         Height          =   255
         Left            =   225
         TabIndex        =   21
         Top             =   3960
         Width           =   1095
      End
      Begin VB.Label Label6 
         Caption         =   "Exchange"
         Height          =   255
         Left            =   225
         TabIndex        =   17
         Top             =   3160
         Width           =   1095
      End
      Begin VB.Label Label5 
         Caption         =   "Strike"
         Height          =   255
         Left            =   225
         TabIndex        =   11
         Top             =   1960
         Width           =   1095
      End
      Begin VB.Label Label4 
         Caption         =   "Expiry"
         Height          =   255
         Left            =   225
         TabIndex        =   9
         Top             =   1560
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "Type"
         Height          =   255
         Left            =   225
         TabIndex        =   7
         Top             =   1160
         Width           =   1095
      End
      Begin VB.Label Label2 
         Caption         =   "Symbol"
         Height          =   255
         Left            =   225
         TabIndex        =   5
         Top             =   760
         Width           =   1095
      End
   End
   Begin VB.TextBox txtReqId 
      Height          =   285
      Left            =   720
      TabIndex        =   1
      Text            =   "0"
      Top             =   240
      Width           =   1575
   End
   Begin VB.Label Label1 
      Caption         =   "Id"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   375
   End
End
Attribute VB_Name = "dlgOrder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Enums
Public Enum Dlg_Type
    REQ_MKT_DATA_DLG = 1
    CANCEL_MKT_DATA_DLG
    REQ_MKT_DEPTH_DLG
    CANCEL_MKT_DEPTH_DLG
    PLACE_ORDER_DLG
    CANCEL_ORDER_DLG
    REQ_CONTRACT_DETAILS_DLG
    REQ_HISTORICAL_DATA
    EXERCISE_OPTIONS
    CANCEL_HIST_DATA_DLG
    REQ_REAL_TIME_BARS
    CANCEL_REAL_TIME_BARS
    CALCULATE_IMPLIED_VOLATILITY
    CALCULATE_OPTION_PRICE
    CANCEL_CALCULATE_IMPLIED_VOLATILITY
    CANCEL_CALCULATE_OPTION_PRICE
	REQ_MARKET_DATA_TYPE
End Enum

Public Enum MARKET_DATA_TYPE
    REALTIME = 1
	FROZEN = 2
End Enum

' ========================================================
' Member variables
' ========================================================
Private m_mainWnd As dlgMainWnd
Private m_arrDlgTitles As New Collection

Private m_orderId As Long

Private m_contractInfo As TWSLib.IContract
Private m_orderInfo As TWSLib.IOrder
Private m_underComp As TWSLib.IUnderComp

Private m_faGroup, m_faMethod, m_faPercentage, m_faProfile As String

Private m_genericTickTags As String
Private m_snapshotMktData As Boolean

Private m_numRows As Long

Private m_exerciseAction As Long
Private m_exerciseQuantity As Long
Private m_exerciseOverride As Long

Private m_barSizeSetting As String
Private m_duration As String
Private m_endDateTime As String
Private m_useRTH As Long
Private m_whatToShow As String
Private m_formatDate As Long
Private m_marketDataType As Long

Private m_ok As Boolean

' ========================================================
' Get/Set Methods
' ========================================================
Public Property Get endDateTime() As String
    endDateTime = m_endDateTime
End Property
Public Property Let endDateTime(ByVal vData As String)
    m_endDateTime = vData
    txtEndDateTime.text = m_endDateTime
End Property
Public Property Get genericTickTags() As String
    genericTickTags = m_genericTickTags
End Property
Public Property Let genericTickTags(ByVal vData As String)
    m_genericTickTags = vData
    txtGenericTickTags.text = m_genericTickTags
End Property
Public Property Get duration() As String
    duration = m_duration
End Property
Public Property Let duration(ByVal vData As String)
    m_duration = vData
    txtDuration.text = m_duration
End Property
Public Property Get formatDate() As Long
    formatDate = m_formatDate
End Property
Public Property Get exerciseAction() As Long
    exerciseAction = m_exerciseAction
End Property
Public Property Get exerciseQuantity() As Long
    exerciseQuantity = m_exerciseQuantity
End Property
Public Property Get exerciseOverride() As Long
    exerciseOverride = m_exerciseOverride
End Property
Public Property Let formatDate(ByVal vData As Long)
    m_formatDate = vData
    txtFormatDate.text = m_formatDate
End Property
Public Property Get whatToShow() As String
    whatToShow = m_whatToShow
End Property
Public Property Let whatToShow(ByVal vData As String)
    m_whatToShow = vData
    txtWhatToShow.text = m_whatToShow
End Property
Public Property Get barSizeSetting() As String
    barSizeSetting = m_barSizeSetting
End Property
Public Property Let barSizeSetting(ByVal vData As String)
    m_barSizeSetting = vData
    txtBarSizeSetting.text = m_barSizeSetting
End Property
Public Property Get useRTH() As Long
    useRTH = m_useRTH
End Property
Public Property Let useRTH(ByVal vData As Long)
    m_useRTH = vData
    txtUseRTH.text = m_useRTH
End Property
Public Property Get orderId() As Long
    orderId = m_orderId
End Property
Public Property Let orderId(ByVal vData As Long)
    m_orderId = vData
    txtReqId.text = m_orderId
End Property
Public Property Get ok() As Boolean
    ok = m_ok
End Property
Public Property Get numRows() As Long
    numRows = m_numRows
End Property
Public Property Let numRows(ByVal vData As Long)
    m_numRows = vData
    txtMktDepth.text = m_numRows
End Property
Public Property Get snapshotMktData() As Boolean
    snapshotMktData = m_snapshotMktData
End Property
Public Property Get marketDataType() As Long
    marketDataType = m_marketDataType
End Property


' ========================================================
' Button Events
' ========================================================
Private Sub cmdAddCmboLegs_Click()
    Dim dlgComboLegs As New dlgComboOrderLegs
   
    dlgComboLegs.init m_contractInfo.comboLegs, m_orderInfo.orderComboLegs, m_mainWnd.Tws1
    dlgComboLegs.Show vbModal
    If dlgComboLegs.ok Then
        Dim comboLegs As TWSLib.IComboLegList
        Set comboLegs = dlgComboLegs.comboLegs
        m_contractInfo.comboLegs = comboLegs
        Dim orderComboLegs As TWSLib.IOrderComboLegList
        Set orderComboLegs = dlgComboLegs.orderComboLegs
        m_orderInfo.orderComboLegs = orderComboLegs
    End If
End Sub

Private Sub cmdSetShareAllocation_Click()
    Dim dlg As New dlgSharesAlloc
    
    With dlg
        .init m_mainWnd.FAManagedAccounts
        .Show vbModal
        If .ok Then
            m_faGroup = .faGroup
            m_faMethod = .faMethod
            m_faPercentage = .faPercentage
            m_faProfile = .faProfile
        End If
    End With
End Sub

Private Sub cmdUnderComp_Click()
    Dim dlg As New dlgUnderComp
    
    With dlg
        .init m_underComp
        .Show vbModal
        If .ok Then
            m_contractInfo.underComp = m_underComp
        ElseIf .reset Then
            m_contractInfo.underComp = Nothing
        End If
    End With
End Sub

Private Sub cmdAlgoParams_Click()
    Dim dlg As New dlgAlgoParams
   
    dlg.init m_orderInfo.algoStrategy, m_orderInfo.algoParams, m_mainWnd.Tws1
    dlg.Show vbModal
    If dlg.ok Then
        m_orderInfo.algoStrategy = dlg.algoStrategy
        m_orderInfo.algoParams = dlg.algoParams
    End If
End Sub

Private Sub cmdSmartComboRoutingParams_Click()
    Dim dlg As New dlgSmartComboRoutingParams
   
    dlg.init m_orderInfo.smartComboRoutingParams, m_mainWnd.Tws1
    dlg.Show vbModal
    If dlg.ok Then
        m_orderInfo.smartComboRoutingParams = dlg.smartComboRoutingParams
    End If
End Sub

Private Sub cmdOk_Click()
    ' Move UI data into member fields
    m_orderId = txtReqId.text
    
    m_contractInfo.conId = txtConId.text
    m_contractInfo.symbol = txtSymbol.text
    m_contractInfo.secType = txtSecType.text
    m_contractInfo.expiry = txtExpiry.text
    m_contractInfo.strike = txtStrike.text
    m_contractInfo.Right = txtRight.text
    m_contractInfo.multiplier = TextMultiplier.text
    m_contractInfo.exchange = txtExchange.text
    m_contractInfo.primaryExchange = TxtPrimaryExchange.text
    m_contractInfo.Currency = txtCurrency.text
    m_contractInfo.localSymbol = txtLocalSymbol.text
    m_contractInfo.tradingClass = txtTradingClass.text
    m_contractInfo.includeExpired = txtIsExpired.text
    m_contractInfo.secIdType = txtSecIdType.text
    m_contractInfo.secId = txtSecId.text
    
    m_orderInfo.Action = txtAction.text
    m_orderInfo.totalQuantity = txtQuantity.text
    m_orderInfo.orderType = txtOrderType.text
    m_orderInfo.lmtPrice = dval(txtLmtPrice.text)
    m_orderInfo.auxPrice = dval(txtAuxPrice.text)
    
    m_orderInfo.goodAfterTime = tGAT.text
    m_orderInfo.goodTillDate = tGTD.text
    
    m_orderInfo.faGroup = m_faGroup
    m_orderInfo.faMethod = m_faMethod
    m_orderInfo.faPercentage = m_faPercentage
    m_orderInfo.faProfile = m_faProfile
    
    m_genericTickTags = txtGenericTickTags.text
    m_snapshotMktData = chkSnapshotMktData.value
    m_numRows = txtMktDepth.text
    
    m_endDateTime = txtEndDateTime.text
    m_duration = txtDuration.text
    m_barSizeSetting = txtBarSizeSetting.text
    m_whatToShow = txtWhatToShow.text
    m_useRTH = txtUseRTH.text
    m_formatDate = txtFormatDate.text
    
    m_exerciseAction = txtExerciseAction.text
    m_exerciseQuantity = txtExerciseQuantity.text
    m_exerciseOverride = txtExerciseOverride.text

    m_marketDataType = cmbMarketDataType.ListIndex + 1
    
    m_ok = True
    Set m_contractInfo = Nothing
    Set m_orderInfo = Nothing
    Set m_underComp = Nothing
    Hide
End Sub
Private Sub cmdCancel_Click()
    m_ok = False
    Set m_contractInfo = Nothing
    Set m_orderInfo = Nothing
    Set m_underComp = Nothing
    Hide
End Sub

' ========================================================
' Public Methods
' ========================================================
'--------------------------------------------------------------------------------
' Sets the dialog field and button states based on the dialog type
'--------------------------------------------------------------------------------
Public Sub init(dlgType As Dlg_Type, ByVal contractInfo As TWSLib.IContract, _
    ByVal orderInfo As TWSLib.IOrder, ByVal underComp As TWSLib.IUnderComp, _
    mainWin As Form)
    m_ok = False
    
    Set m_contractInfo = contractInfo
    Set m_orderInfo = orderInfo
    Set m_underComp = underComp

    Set m_mainWnd = dlgMainWnd
    Caption = m_arrDlgTitles.Item(dlgType)

    cmdSetShareAllocation.Enabled = (m_mainWnd.isFAAccount() And dlgType = Dlg_Type.PLACE_ORDER_DLG)
    cmdAddCmboLegs.Enabled = _
            (dlgType = Dlg_Type.PLACE_ORDER_DLG Or _
            dlgType = Dlg_Type.REQ_MKT_DATA_DLG Or _
            dlgType = Dlg_Type.REQ_MKT_DEPTH_DLG Or _
            dlgType = Dlg_Type.REQ_HISTORICAL_DATA)
            
    cmdUnderComp.Enabled = _
            (dlgType = Dlg_Type.PLACE_ORDER_DLG Or _
            dlgType = Dlg_Type.REQ_MKT_DATA_DLG)

    txtReqId.Enabled = True
    txtBarSizeSetting.Enabled = (dlgType = Dlg_Type.REQ_HISTORICAL_DATA)
    txtDuration.Enabled = (dlgType = Dlg_Type.REQ_HISTORICAL_DATA)
    txtEndDateTime.Enabled = (dlgType = Dlg_Type.REQ_HISTORICAL_DATA)
    txtWhatToShow.Enabled = (dlgType = Dlg_Type.REQ_HISTORICAL_DATA Or dlgType = REQ_REAL_TIME_BARS)
    txtUseRTH.Enabled = (dlgType = Dlg_Type.REQ_HISTORICAL_DATA Or dlgType = REQ_REAL_TIME_BARS)
    txtFormatDate.Enabled = (dlgType = Dlg_Type.REQ_HISTORICAL_DATA)
    txtMktDepth.Enabled = (dlgType = Dlg_Type.REQ_MKT_DEPTH_DLG)
    txtExerciseAction.Enabled = (dlgType = Dlg_Type.EXERCISE_OPTIONS)
    txtExerciseQuantity.Enabled = (dlgType = Dlg_Type.EXERCISE_OPTIONS)
    txtExerciseOverride.Enabled = (dlgType = Dlg_Type.EXERCISE_OPTIONS)
    txtGenericTickTags.Enabled = (dlgType = REQ_MKT_DATA_DLG)
    chkSnapshotMktData.Enabled = (dlgType = REQ_MKT_DATA_DLG)
    cmbMarketDataType.Enabled = (dlgType = Dlg_Type.REQ_MARKET_DATA_TYPE)
    
    ' enable or disable contract fields
    If dlgType = Dlg_Type.CANCEL_MKT_DATA_DLG Or _
           dlgType = Dlg_Type.CANCEL_MKT_DEPTH_DLG Or _
           dlgType = Dlg_Type.CANCEL_ORDER_DLG Or _
           dlgType = Dlg_Type.CANCEL_HIST_DATA_DLG Or _
           dlgType = Dlg_Type.CANCEL_REAL_TIME_BARS Or _ 
           dlgType = Dlg_Type.CANCEL_CALCULATE_IMPLIED_VOLATILITY Or _
           dlgType = Dlg_Type.CANCEL_CALCULATE_OPTION_PRICE Or _
           dlgType = Dlg_Type.REQ_MARKET_DATA_TYPE Then
            txtConId.Enabled = False
            txtSymbol.Enabled = False
            txtSecType.Enabled = False
            txtExpiry.Enabled = False
            txtStrike.Enabled = False
            txtRight.Enabled = False
            TextMultiplier.Enabled = False
            txtExchange.Enabled = False
            TxtPrimaryExchange.Enabled = False
            txtCurrency.Enabled = False
            txtLocalSymbol.Enabled = False
            txtTradingClass.Enabled = False
            txtIsExpired.Enabled = False
    Else
            txtConId.Enabled = True
            txtSymbol.Enabled = True
            txtSecType.Enabled = True
            txtExpiry.Enabled = True
            txtStrike.Enabled = True
            txtRight.Enabled = True
            TextMultiplier.Enabled = True
            txtExchange.Enabled = True
            TxtPrimaryExchange.Enabled = True
            txtCurrency.Enabled = True
            txtLocalSymbol.Enabled = True
            txtTradingClass.Enabled = True
            txtIsExpired.Enabled = True
    End If

    ' enable or disable order fields
    If dlgType = Dlg_Type.PLACE_ORDER_DLG Then
            txtAction.Enabled = True
            txtQuantity.Enabled = True
            txtOrderType.Enabled = True
            txtLmtPrice.Enabled = True
            txtAuxPrice.Enabled = True
            tGAT.Enabled = True
            tGTD.Enabled = True
    Else
            txtAction.Enabled = False
            txtQuantity.Enabled = False
            txtOrderType.Enabled = False
            txtLmtPrice.Enabled = False
            txtAuxPrice.Enabled = False
            tGAT.Enabled = False
            tGTD.Enabled = False
    End If

    If dlgType = Dlg_Type.CALCULATE_IMPLIED_VOLATILITY  Or dlgType = Dlg_Type.CALCULATE_OPTION_PRICE Then
            txtLmtPrice.Enabled = True
            txtAuxPrice.Enabled = True
    End If

    If dlgType = Dlg_Type.PLACE_ORDER_DLG Or dlgType = Dlg_Type.REQ_CONTRACT_DETAILS_DLG Then
            txtSecIdType.Enabled = True
            txtSecId.Enabled = True
    Else
            txtSecIdType.Enabled = False
            txtSecId.Enabled = False
    End If

    If dlgType = Dlg_Type.REQ_MARKET_DATA_TYPE Then
            txtReqId.Enabled = False
            txtConId.Enabled = False
            cmdAlgoParams.Enabled = False
            cmdSmartComboRoutingParams.Enabled = False
    End If
	
End Sub

'--------------------------------------------------------------------------------
' Set the various dialog title string for each dialog type and the initial
' dialog data.
'--------------------------------------------------------------------------------
Private Sub Form_Initialize()

    m_orderId = 0
    
    txtEndDateTime.text = Format(Now(), "yyyyMMdd HH:mm:dd")

    m_arrDlgTitles.Add "Request Market Data"
    m_arrDlgTitles.Add "Cancel Market Data"
    m_arrDlgTitles.Add "Request Market Depth"
    m_arrDlgTitles.Add "Cancel Market Depth"
    m_arrDlgTitles.Add "Place Order"
    m_arrDlgTitles.Add "Cancel Order"
    m_arrDlgTitles.Add "Request Contract Details"
    m_arrDlgTitles.Add "Request Historical Data"
    m_arrDlgTitles.Add "ExerciseOptions"
    m_arrDlgTitles.Add "Cancel Historical Data"
    m_arrDlgTitles.Add "Request Real Time Bars"
    m_arrDlgTitles.Add "Cancel Real Time Bars"
    m_arrDlgTitles.Add "Calculate Implied Volatility"
    m_arrDlgTitles.Add "Calculate Option Price"
    m_arrDlgTitles.Add "Cancel Calculate Implied Volatility"
    m_arrDlgTitles.Add "Cancel Calculate Option Price"
    m_arrDlgTitles.Add "Request Market Data Type"
	
	cmbMarketDataType.clear
	cmbMarketDataType.AddItem ("Real-Time")
	cmbMarketDataType.AddItem ("Frozen")
	
	cmbMarketDataType.ListIndex = MARKET_DATA_TYPE.REALTIME - 1 ' Default market data type

End Sub

Private Function dval(ByVal text As String) As Double
    If Len(text) = 0 Then
        dval = m_mainWnd.m_maxDouble
    Else
        dval = text
    End If
End Function
