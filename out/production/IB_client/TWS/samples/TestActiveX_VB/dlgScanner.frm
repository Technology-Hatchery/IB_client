' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgScanner 
   Caption         =   "Market Scanner"
   ClientHeight    =   9240
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5925
   LinkTopic       =   "Form1"
   ScaleHeight     =   9240
   ScaleWidth      =   5925
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancelSubscription 
      Caption         =   "Cancel Subscription"
      Height          =   375
      Left            =   4200
      TabIndex        =   24
      Top             =   8760
      Width           =   1695
   End
   Begin VB.CommandButton cmdSubscribe 
      Caption         =   "Subscribe"
      Height          =   375
      Left            =   2280
      TabIndex        =   23
      Top             =   8760
      Width           =   1455
   End
   Begin VB.CommandButton cmdRequestParameters 
      Caption         =   "Request Parameters"
      Height          =   375
      Left            =   0
      TabIndex        =   22
      Top             =   8760
      Width           =   1815
   End
   Begin VB.TextBox txtReqId 
      Height          =   285
      Left            =   3000
      TabIndex        =   1
      Text            =   "0"
      Top             =   360
      Width           =   2775
   End
   Begin VB.Frame frameTickerDesc 
      Caption         =   "Subscription Info"
      Height          =   7815
      Left            =   0
      TabIndex        =   0
      Top             =   840
      Width           =   5895
      Begin VB.TextBox txtStockTypeFilter 
         Height          =   285
         Left            =   3000
         TabIndex        =   47
         Top             =   7440
         Width           =   2775
      End
      Begin VB.TextBox txtAverageOptionVolumeAbove 
         Height          =   285
         Left            =   3000
         TabIndex        =   9
         Text            =   "0"
         Top             =   2831
         Width           =   2775
      End
      Begin VB.TextBox txtScannerSettingPairs 
         Height          =   285
         Left            =   3000
         TabIndex        =   21
         Text            =   "Annual,true"
         Top             =   7080
         Width           =   2775
      End
      Begin VB.TextBox txtNumberOfRows 
         Height          =   285
         Left            =   3000
         TabIndex        =   2
         Text            =   "10"
         Top             =   360
         Width           =   2775
      End
      Begin VB.TextBox txtInstrument 
         Height          =   285
         Left            =   3000
         TabIndex        =   3
         Text            =   "STK"
         Top             =   713
         Width           =   2775
      End
      Begin VB.TextBox txtLocationCode 
         Height          =   285
         Left            =   3000
         TabIndex        =   4
         Text            =   "STK.US.MAJOR"
         Top             =   1066
         Width           =   2775
      End
      Begin VB.TextBox txtScanCode 
         Height          =   285
         Left            =   3000
         TabIndex        =   5
         Text            =   "TOP_PERC_GAIN"
         Top             =   1440
         Width           =   2775
      End
      Begin VB.TextBox txtAboveVolume 
         Height          =   285
         Left            =   3000
         TabIndex        =   8
         Text            =   "0"
         Top             =   2478
         Width           =   2775
      End
      Begin VB.TextBox txtMarketCapBelow 
         Height          =   285
         Left            =   3000
         TabIndex        =   11
         Top             =   3537
         Width           =   2775
      End
      Begin VB.TextBox txtMoodyRatingAbove 
         Height          =   285
         Left            =   3000
         TabIndex        =   12
         Top             =   3890
         Width           =   2775
      End
      Begin VB.TextBox txtAbovePrice 
         Height          =   285
         Left            =   3000
         TabIndex        =   6
         Text            =   "3"
         Top             =   1800
         Width           =   2775
      End
      Begin VB.TextBox TxtMarketCapAbove 
         Height          =   285
         Left            =   3000
         TabIndex        =   10
         Text            =   "100000000"
         Top             =   3184
         Width           =   2775
      End
      Begin VB.TextBox txtBelowPrice 
         Height          =   285
         Left            =   3000
         TabIndex        =   7
         Top             =   2125
         Width           =   2775
      End
      Begin VB.TextBox txtMoodyRatingBelow 
         Height          =   285
         Left            =   3000
         TabIndex        =   13
         Top             =   4243
         Width           =   2775
      End
      Begin VB.TextBox txtSpRatingAbove 
         Height          =   285
         Left            =   3000
         TabIndex        =   14
         Top             =   4596
         Width           =   2775
      End
      Begin VB.TextBox txtMaturityDateBelow 
         Height          =   285
         Left            =   3000
         TabIndex        =   17
         Top             =   5655
         Width           =   2775
      End
      Begin VB.TextBox txtCouponRateBelow 
         Height          =   285
         Left            =   3000
         TabIndex        =   19
         Top             =   6361
         Width           =   2775
      End
      Begin VB.TextBox txtExcludeConvertibles 
         Height          =   285
         Left            =   3000
         TabIndex        =   20
         Text            =   "0"
         Top             =   6714
         Width           =   2775
      End
      Begin VB.TextBox txtSpRatingBelow 
         Height          =   285
         Left            =   3000
         TabIndex        =   15
         Top             =   4949
         Width           =   2775
      End
      Begin VB.TextBox txtCouponRateAbove 
         Height          =   285
         Left            =   3000
         TabIndex        =   18
         Top             =   6008
         Width           =   2775
      End
      Begin VB.TextBox txtMaturityDateAbove 
         Height          =   285
         Left            =   3000
         TabIndex        =   16
         Top             =   5302
         Width           =   2775
      End
      Begin VB.Label Label22 
         Caption         =   "Stock Type Filter"
         Height          =   195
         Left            =   360
         TabIndex        =   48
         Top             =   7440
         Width           =   1695
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label21 
         Caption         =   "Average Option Volume Above"
         Height          =   195
         Left            =   360
         TabIndex        =   46
         Top             =   2876
         Width           =   2295
      End
      Begin VB.Label Label20 
         Caption         =   "Scanner Setting Pairs"
         Height          =   195
         Left            =   360
         TabIndex        =   45
         Top             =   7125
         Width           =   1695
         WordWrap        =   -1  'True
      End
      Begin VB.Label Label2 
         Caption         =   "Number of Rows"
         Height          =   195
         Left            =   360
         TabIndex        =   44
         Top             =   405
         Width           =   1695
      End
      Begin VB.Label Label19 
         Caption         =   "Moody Rating Below"
         Height          =   195
         Left            =   360
         TabIndex        =   43
         Top             =   4288
         Width           =   1935
      End
      Begin VB.Label Label16 
         Caption         =   "S and P Rating Above"
         Height          =   195
         Left            =   360
         TabIndex        =   42
         Top             =   4641
         Width           =   1695
      End
      Begin VB.Label Label15 
         Caption         =   "Maturity Date Below"
         Height          =   195
         Left            =   360
         TabIndex        =   41
         Top             =   5700
         Width           =   1695
      End
      Begin VB.Label Label14 
         Caption         =   "Coupon Rate Below"
         Height          =   195
         Left            =   360
         TabIndex        =   40
         Top             =   6406
         Width           =   1575
      End
      Begin VB.Label Label13 
         Caption         =   "Exclude Convertibles"
         Height          =   195
         Left            =   360
         TabIndex        =   39
         Top             =   6759
         Width           =   1695
      End
      Begin VB.Label Label12 
         Caption         =   "S and P Rating Below"
         Height          =   195
         Left            =   360
         TabIndex        =   38
         Top             =   4994
         Width           =   1695
      End
      Begin VB.Label Label11 
         Caption         =   "Coupon Rate Above"
         Height          =   195
         Left            =   360
         TabIndex        =   37
         Top             =   6053
         Width           =   1455
      End
      Begin VB.Label Label10 
         Caption         =   "Maturity Date Above"
         Height          =   195
         Left            =   360
         TabIndex        =   36
         Top             =   5347
         Width           =   1695
      End
      Begin VB.Label Label3 
         Caption         =   "Instrument"
         Height          =   195
         Left            =   360
         TabIndex        =   33
         Top             =   758
         Width           =   1695
      End
      Begin VB.Label Label4 
         Caption         =   "Location Code"
         Height          =   195
         Left            =   360
         TabIndex        =   32
         Top             =   1111
         Width           =   1095
      End
      Begin VB.Label Label5 
         Caption         =   "Scan Code"
         Height          =   195
         Left            =   360
         TabIndex        =   31
         Top             =   1464
         Width           =   1095
      End
      Begin VB.Label Label6 
         Caption         =   "Above Volume"
         Height          =   195
         Left            =   360
         TabIndex        =   30
         Top             =   2523
         Width           =   1095
      End
      Begin VB.Label Label7 
         Caption         =   "Market Cap Below"
         Height          =   195
         Left            =   360
         TabIndex        =   29
         Top             =   3582
         Width           =   1575
      End
      Begin VB.Label Label8 
         Caption         =   "Moody Rating Above"
         Height          =   195
         Left            =   360
         TabIndex        =   28
         Top             =   3935
         Width           =   1695
      End
      Begin VB.Label Label9 
         Caption         =   "Above Price"
         Height          =   195
         Left            =   360
         TabIndex        =   27
         Top             =   1817
         Width           =   1095
      End
      Begin VB.Label Label17 
         Caption         =   "Market Cap Above"
         Height          =   195
         Left            =   360
         TabIndex        =   26
         Top             =   3229
         Width           =   1455
      End
      Begin VB.Label Label18 
         Caption         =   "Below Price"
         Height          =   195
         Left            =   360
         TabIndex        =   25
         Top             =   2170
         Width           =   1095
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Message Id"
      Height          =   615
      Left            =   120
      TabIndex        =   34
      Top             =   120
      Width           =   5775
      Begin VB.Label Label1 
         Caption         =   "Id"
         Height          =   255
         Left            =   240
         TabIndex        =   35
         Top             =   240
         Width           =   855
      End
   End
End
Attribute VB_Name = "dlgScanner"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private m_subscription As TWSLib.IScannerSubscription
Private m_mainWnd As dlgMainWnd

Private m_id As Integer
Private m_ok As Boolean

' ========================================================
' Public Methods
' ========================================================
Public Sub init(ByRef mainWin As Form)
    m_ok = False
    Set m_mainWnd = dlgMainWnd
    Set m_subscription = dlgMainWnd.Tws1.createScannerSubscription
End Sub


' ========================================================
' Private Methods
' ========================================================
Private Sub cmdCancel_Click()
    m_ok = False
    Hide
End Sub

Private Sub cmdRequestParameters_Click()
    Call m_mainWnd.requestScannerParameters
    Hide
End Sub

Private Sub cmdCancelSubscription_Click()
    Call populateSubscription
    Call m_mainWnd.cancelScannerSubscription(m_id)
    Hide
End Sub
    
Private Sub cmdSubscribe_Click()
    Call populateSubscription
    Call m_mainWnd.scannerSubscription(m_id, m_subscription)
    Hide
End Sub

Private Sub populateSubscription()
    m_id = txtReqId.text
    With m_subscription
        .numberOfRows = numFromText(txtNumberOfRows.text)
        .instrument = txtInstrument.text
        .locations = txtLocationCode.text
        .scanCode = txtScanCode.text
        .priceAbove = numFromText(txtAbovePrice.text)
        .priceBelow = numFromText(txtBelowPrice.text)
        .volumeAbove = numFromText(txtAboveVolume.text)
        .averageOptionVolumeAbove = numFromText(txtAverageOptionVolumeAbove.text)
        .marketCapAbove = numFromText(TxtMarketCapAbove.text)
        .marketCapBelow = numFromText(txtMarketCapBelow.text)
        .moodyRatingAbove = txtMoodyRatingAbove.text
        .moodyRatingBelow = txtMoodyRatingBelow.text
        .spRatingAbove = txtSpRatingAbove.text
        .spRatingBelow = txtSpRatingBelow.text
        .maturityDateAbove = txtMaturityDateAbove.text
        .maturityDateBelow = txtMaturityDateBelow.text
        .couponRateAbove = numFromText(txtCouponRateAbove.text)
        .couponRateBelow = numFromText(txtCouponRateBelow.text)
        .excludeConvertible = numFromText(txtExcludeConvertibles.text)
        .scannerSettingPairs = txtScannerSettingPairs.text
        .stockTypeFilter = txtStockTypeFilter.text
    End With
End Sub

Private Function numFromText(ByRef textStr As String) As Double
    If textStr = "" Then
        numFromText = -1
    Else
        numFromText = textStr
    End If
End Function
