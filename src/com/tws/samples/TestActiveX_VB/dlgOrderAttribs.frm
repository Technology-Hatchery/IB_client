' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgOrderAttribs 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Extended Order Attributes"
   ClientHeight    =   9390
   ClientLeft      =   15450
   ClientTop       =   4050
   ClientWidth     =   12945
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9390
   ScaleWidth      =   12945
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtScaleTable
      Height          =   285
      Left            =   6600
      TabIndex        =   82
      Top             =   7680
      Width           =   1455
   End
   Begin VB.TextBox txtActiveStartTime
      Height          =   285
      Left            =   6600
      TabIndex        =   84
      Top             =   8040
      Width           =   1455
   End
   Begin VB.TextBox txtActiveStopTime
      Height          =   285
      Left            =   6600
      TabIndex        =   86
      Top             =   8400
      Width           =   1455
   End
   Begin VB.TextBox txtDeltaNeutralDesignatedLocation
      Height          =   285
      Left            =   11280
      TabIndex        =   109
      Top             =   4080
      Width           =   1455
   End
   Begin VB.TextBox txtDeltaNeutralShortSaleSlot
      Height          =   285
      Left            =   11280
      TabIndex        =   107
      Top             =   3720
      Width           =   1455
   End
   Begin VB.CheckBox checkDeltaNeutralShortSale
      Caption         =   "VOL: Hedge Delta Short Sale"
      Height          =   255
      Left            =   8400
      TabIndex        =   105
      Top             =   3360
      Width           =   3375
   End
   Begin VB.TextBox txtDeltaNeutralOpenClose
      Height          =   285
      Left            =   11280
      TabIndex        =   104
      Top             =   3000
      Width           =   1455
   End
  
   Begin VB.TextBox txtTrailingPercent 
      Height          =   285
      Left            =   6600
      TabIndex        =   42
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtScaleInitFillQty 
      Height          =   285
      Left            =   11280
      TabIndex        =   130
      Top             =   8040
      Width           =   1455
   End
   Begin VB.TextBox txtScaleInitPosition
      Height          =   285
      Left            =   11280
      TabIndex        =   128
      Top             =   7680
      Width           =   1455
   End
   Begin VB.TextBox txtScaleProfitOffset
      Height          =   285
      Left            =   11280
      TabIndex        =   125
      Top             =   6960
      Width           =   1455
   End
   Begin VB.TextBox txtScalePriceAdjustInterval
      Height          =   285
      Left            =   11280
      TabIndex        =   123
      Top             =   6600
      Width           =   1455
   End
   Begin VB.TextBox txtScalePriceAdjustValue
      Height          =   285
      Left            =   11280
      TabIndex        =   121
      Top             =   6240
      Width           =   1455
   End
   Begin VB.CheckBox checkScaleRandomPercent 
      Caption         =   "SCALE: Random Percent"
      Height          =   255
      Left            =   8400
      TabIndex        =   131
      Top             =   8400
      Width           =   3375
   End
   Begin VB.CheckBox checkScaleAutoReset
      Caption         =   "SCALE: Auto Reset"
      Height          =   255
      Left            =   8400
      TabIndex        =   126
      Top             =   7320
      Width           =   3375
   End
   Begin VB.CheckBox checkOptOutSmartRouting 
      Caption         =   "Opting out of SMART routing"
      Height          =   255
      Left            =   240
      TabIndex        =   38
      Top             =   6960
      Width           =   3375
   End
   Begin VB.TextBox txtHedgeParam 
      Height          =   285
      Left            =   2160
      TabIndex        =   37
      ToolTipText     =   "Allowed values are 'beta' for beta hedge and 'ratio' for pair hedge"
      Top             =   6600
      Width           =   1455
   End
   Begin VB.TextBox txtHedgeType 
      Height          =   285
      Left            =   2160
      TabIndex        =   35
      Top             =   6240
      Width           =   1455
   End
   Begin VB.TextBox txtExemptCode 
      Height          =   285
      Left            =   2160
      TabIndex        =   31
      Text            =   "-1"
      Top             =   5520
      Width           =   1455
   End
   Begin VB.TextBox txtClearingIntent 
      Height          =   285
      Left            =   2160
      TabIndex        =   13
      Top             =   2280
      Width           =   1455
   End
   Begin VB.TextBox txtClearingAccount 
      Height          =   285
      Left            =   2160
      TabIndex        =   11
      Top             =   1920
      Width           =   1455
   End
   Begin VB.TextBox txtScalePriceIncr 
      Height          =   285
      Left            =   11280
      TabIndex        =   119
      Top             =   5880
      Width           =   1455
   End
   Begin VB.TextBox txtScaleSubsLevelSize 
      Height          =   285
      Left            =   11280
      TabIndex        =   117
      Top             =   5520
      Width           =   1455
   End
   Begin VB.TextBox txtScaleInitLevelSize 
      Height          =   285
      Left            =   11280
      TabIndex        =   115
      Top             =   5160
      Width           =   1455
   End
   Begin VB.TextBox txtTrailStopPrice 
      Height          =   285
      Left            =   6600
      TabIndex        =   40
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox txtDeltaNeutralAuxPrice 
      Height          =   285
      Left            =   11280
      TabIndex        =   94
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox txtReferencePriceType 
      Height          =   285
      Left            =   11280
      TabIndex        =   113
      Top             =   4800
      Width           =   1455
   End
   Begin VB.TextBox txtContinuousUpdate 
      Height          =   285
      Left            =   11280
      TabIndex        =   111
      Top             =   4440
      Width           =   1455
   End
   Begin VB.TextBox txtDeltaNeutralOrderType 
      Height          =   285
      Left            =   11280
      TabIndex        =   92
      Top             =   840
      Width           =   1455
   End
   Begin VB.TextBox txtVolatilityType 
      Height          =   285
      Left            =   11280
      TabIndex        =   90
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtVolatility 
      Height          =   285
      Left            =   11280
      TabIndex        =   88
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox txtOverridePercentageConstraints 
      Height          =   285
      Left            =   6600
      TabIndex        =   56
      Text            =   "0"
      Top             =   3000
      Width           =   1455
   End
   Begin VB.TextBox txtRule80A 
      Height          =   285
      Left            =   2160
      TabIndex        =   33
      Top             =   5880
      Width           =   1455
   End
   Begin VB.TextBox txtSettlingFirm 
      Height          =   285
      Left            =   2160
      TabIndex        =   9
      Top             =   1560
      Width           =   1455
   End
   Begin VB.TextBox txtMinQty 
      Height          =   285
      Left            =   6600
      TabIndex        =   46
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox txtPercentOffset 
      Height          =   285
      Left            =   6600
      TabIndex        =   48
      Top             =   1560
      Width           =   1455
   End
   Begin VB.TextBox txtETradeOnly 
      Height          =   285
      Left            =   6600
      TabIndex        =   50
      Text            =   "0"
      Top             =   1920
      Width           =   1455
   End
   Begin VB.TextBox txtFirmQuoteOnly 
      Height          =   285
      Left            =   6600
      TabIndex        =   52
      Text            =   "0"
      Top             =   2280
      Width           =   1455
   End
   Begin VB.TextBox txtNBBOPriceCap 
      Height          =   285
      Left            =   6600
      TabIndex        =   54
      Top             =   2640
      Width           =   1455
   End
   Begin VB.TextBox txtAuctionStrategy 
      Height          =   285
      Left            =   6600
      TabIndex        =   70
      Text            =   "0"
      Top             =   5520
      Width           =   1455
   End
   Begin VB.TextBox txtStartingPrice 
      Height          =   285
      Left            =   6600
      TabIndex        =   72
      Top             =   5880
      Width           =   1455
   End
   Begin VB.TextBox txtStockRefPrice 
      Height          =   285
      Left            =   6600
      TabIndex        =   74
      Top             =   6240
      Width           =   1455
   End
   Begin VB.TextBox txtDelta 
      Height          =   285
      Left            =   6600
      TabIndex        =   76
      Top             =   6600
      Width           =   1455
   End
   Begin VB.TextBox txtStockRangeLower 
      Height          =   285
      Left            =   6600
      TabIndex        =   78
      Top             =   6960
      Width           =   1455
   End
   Begin VB.TextBox txtStockRangeUpper 
      Height          =   285
      Left            =   6600
      TabIndex        =   80
      Top             =   7320
      Width           =   1455
   End
   Begin VB.TextBox txtAllOrNone 
      Height          =   285
      Left            =   6600
      TabIndex        =   44
      Text            =   "0"
      Top             =   840
      Width           =   1455
   End
   Begin VB.TextBox txtOcaType 
      Height          =   285
      Left            =   2160
      TabIndex        =   5
      Text            =   "0"
      Top             =   840
      Width           =   1455
   End
   Begin VB.TextBox txtShortSaleSlot 
      Height          =   285
      Left            =   6600
      TabIndex        =   68
      Top             =   5160
      Width           =   1455
   End
   Begin VB.TextBox txtDesignatedLocation 
      Height          =   285
      Left            =   2160
      TabIndex        =   29
      Top             =   5160
      Width           =   1455
   End
   Begin VB.TextBox txtDiscretionaryAmt 
      Height          =   285
      Left            =   6600
      TabIndex        =   66
      Text            =   "0"
      Top             =   4800
      Width           =   1455
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   4800
      TabIndex        =   134
      Top             =   8880
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   6720
      TabIndex        =   133
      Top             =   8880
      Width           =   1095
   End
   Begin VB.TextBox txtHidden 
      Height          =   285
      Left            =   6600
      TabIndex        =   64
      Text            =   "0"
      Top             =   4440
      Width           =   1455
   End
   Begin VB.TextBox txtOutsideRth 
      Height          =   285
      Left            =   6600
      TabIndex        =   62
      Text            =   "0"
      Top             =   4080
      Width           =   1455
   End
   Begin VB.TextBox txtTriggerMethod 
      Height          =   285
      Left            =   6600
      TabIndex        =   60
      Text            =   "0"
      Top             =   3720
      Width           =   1455
   End
   Begin VB.TextBox txtDisplaySize 
      Height          =   285
      Left            =   6600
      TabIndex        =   58
      Text            =   "0"
      Top             =   3360
      Width           =   1455
   End
   Begin VB.TextBox txtSweepToFill 
      Height          =   285
      Left            =   2160
      TabIndex        =   27
      Text            =   "0"
      Top             =   4800
      Width           =   1455
   End
   Begin VB.TextBox txtBlockOrder 
      Height          =   285
      Left            =   2160
      TabIndex        =   25
      Text            =   "0"
      Top             =   4440
      Width           =   1455
   End
   Begin VB.TextBox txtTransmit 
      Height          =   285
      Left            =   2160
      TabIndex        =   23
      Text            =   "1"
      Top             =   4080
      Width           =   1455
   End
   Begin VB.TextBox txtParentId 
      Height          =   285
      Left            =   2160
      TabIndex        =   21
      Text            =   "0"
      Top             =   3720
      Width           =   1455
   End
   Begin VB.TextBox txtOrderRef 
      Height          =   285
      Left            =   2160
      TabIndex        =   19
      Top             =   3360
      Width           =   1455
   End
   Begin VB.TextBox txtOrigin 
      Height          =   285
      Left            =   2160
      TabIndex        =   17
      Text            =   "0"
      Top             =   3000
      Width           =   1455
   End
   Begin VB.TextBox txtOpenClose 
      Height          =   285
      Left            =   2160
      TabIndex        =   15
      Text            =   "O"
      Top             =   2640
      Width           =   1455
   End
   Begin VB.TextBox txtAccount 
      Height          =   285
      Left            =   2160
      TabIndex        =   7
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox txtOCA 
      Height          =   285
      Left            =   2160
      TabIndex        =   3
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtTIF 
      Height          =   285
      Left            =   2160
      TabIndex        =   1
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox txtDeltaNeutralConId 
      Height          =   285
      Left            =   11280
      TabIndex        =   96
      Top             =   1560
      Width           =   1455
   End
   Begin VB.TextBox txtDeltaNeutralSettlingFirm 
      Height          =   285
      Left            =   11280
      TabIndex        =   98
      Top             =   1920
      Width           =   1455
   End
   Begin VB.TextBox txtDeltaNeutralClearingAccount 
      Height          =   285
      Left            =   11280
      TabIndex        =   100
      Top             =   2280
      Width           =   1455
   End
   Begin VB.TextBox txtDeltaNeutralClearingIntent 
      Height          =   285
      Left            =   11280
      TabIndex        =   102
      Top             =   2640
      Width           =   1455
   End
   Begin VB.Label labelScaleTable 
      Caption         =   "SCALE: Scale Table"
      Height          =   255
      Left            =   3960
      TabIndex        =   81
      Top             =   7680
      Width           =   2775
   End
   Begin VB.Label labelActiveStartTime
      Caption         =   "Active Start Time"
      Height          =   255
      Left            =   3960
      TabIndex        =   83
      Top             =   8040
      Width           =   2775
   End
   Begin VB.Label labelActiveStopTime 
      Caption         =   "Active Stop Time"
      Height          =   255
      Left            =   3960
      TabIndex        =   85
      Top             =   8400
      Width           =   2775
   End
   Begin VB.Label labelDeltaNeutralDesignatedLocation 
      Caption         =   "VOL: Hedge Delta Designated Locat"
      Height          =   255
      Left            =   8400
      TabIndex        =   108
      Top             =   4080
      Width           =   2775
   End
   Begin VB.Label labelDeltaNeutralShortSaleSlot
      Caption         =   "VOL: Hedge Delta Short Sale Slot"
      Height          =   255
      Left            =   8400
      TabIndex        =   106
      Top             =   3720
      Width           =   2775
   End
   Begin VB.Label labelDeltaNeutralOpenClose
      Caption         =   "VOL: Hedge Delta Open/Close"
      Height          =   255
      Left            =   8400
      TabIndex        =   103
      Top             =   3000
      Width           =   2775
   End
   Begin VB.Label labelTrailingPercent 
      Caption         =   "Trailing Percent"
      Height          =   255
      Left            =   3960
      TabIndex        =   41
      Top             =   480
      Width           =   1695
   End
   Begin VB.Label labelScaleInitFillQty 
      Caption         =   "SCALE: Init Fill Qty"
      Height          =   255
      Left            =   8400
      TabIndex        =   129
      Top             =   8040
      Width           =   2655
   End
   Begin VB.Label labelScaleInitPosition
      Caption         =   "SCALE: Init Position"
      Height          =   255
      Left            =   8400
      TabIndex        =   127
      Top             =   7680
      Width           =   2535
   End
   Begin VB.Label labelScaleProfitOffset
      Caption         =   "SCALE: Profit Offset"
      Height          =   255
      Left            =   8400
      TabIndex        =   124
      Top             =   6960
      Width           =   2655
   End
   Begin VB.Label labelScalePriceAdjustInterval
      Caption         =   "SCALE: Price Adjust Interval"
      Height          =   255
      Left            =   8400
      TabIndex        =   122
      Top             =   6600
      Width           =   2655
   End
   Begin VB.Label labelScalePriceAdjustValue
      Caption         =   "SCALE: Price Adjust Value"
      Height          =   255
      Left            =   8400
      TabIndex        =   120
      Top             =   6240
      Width           =   2655
   End
   Begin VB.Label labelHedgeParam 
      Caption         =   "Hedge: param"
      Height          =   255
      Left            =   240
      TabIndex        =   36
      Top             =   6600
      Width           =   1095
   End
   Begin VB.Label labelHedgeType 
      Caption         =   "Hedge: type"
      Height          =   255
      Left            =   240
      TabIndex        =   34
      Top             =   6240
      Width           =   1095
   End
   Begin VB.Label labelDeltaNeutralConId 
      Caption         =   "VOL: Hedge Delta Con Id"
      Height          =   255
      Left            =   8400
      TabIndex        =   95
      Top             =   1560
      Width           =   2415
   End
   Begin VB.Label labelDeltaNeutralSettlingFirm 
      Caption         =   "VOL: Hedge Delta Settling Firm"
      Height          =   255
      Left            =   8400
      TabIndex        =   97
      Top             =   1920
      Width           =   2415
   End
   Begin VB.Label labelDeltaNeutralClearingAccount 
      Caption         =   "VOL: Hedge Delta Clearing Account"
      Height          =   255
      Left            =   8400
      TabIndex        =   99
      Top             =   2280
      Width           =   2775
   End
   Begin VB.Label labelDeltaNeutralClearingIntent 
      Caption         =   "VOL: Hedge Delta Clearing Intent"
      Height          =   255
      Left            =   8400
      TabIndex        =   101
      Top             =   2640
      Width           =   2775
   End
   Begin VB.Label labelExemptCode 
      Caption         =   "Exempt Code"
      Height          =   255
      Left            =   240
      TabIndex        =   30
      Top             =   5520
      Width           =   1575
   End
   Begin VB.Label labelClearingIntent 
      Caption         =   "Clearing Intent"
      Height          =   255
      Left            =   240
      TabIndex        =   12
      Top             =   2280
      Width           =   1455
   End
   Begin VB.Label labelClearingAccount 
      Caption         =   "Clearing Account"
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   1920
      Width           =   1455
   End
   Begin VB.Label labelScalePriceIncr 
      Caption         =   "SCALE: Price Increment"
      Height          =   255
      Left            =   8400
      TabIndex        =   118
      Top             =   5880
      Width           =   2055
   End
   Begin VB.Label labelScaleSubsLevelSize 
      Caption         =   "SCALE: Subs Level Size"
      Height          =   255
      Left            =   8400
      TabIndex        =   116
      Top             =   5520
      Width           =   2055
   End
   Begin VB.Label labelScaleInitLevelSize 
      Caption         =   "SCALE: Init Level Size"
      Height          =   255
      Left            =   8400
      TabIndex        =   114
      Top             =   5160
      Width           =   2055
   End
   Begin VB.Label labelTrailStopPrice 
      Caption         =   "Trailing Stop Price"
      Height          =   255
      Left            =   3960
      TabIndex        =   39
      Top             =   120
      Width           =   1695
   End
   Begin VB.Label labelDeltaNeutralAuxPrice 
      Caption         =   "VOL: Hedge Delta Aux Price"
      Height          =   255
      Left            =   8400
      TabIndex        =   93
      Top             =   1200
      Width           =   2415
   End
   Begin VB.Label labelReferencePriceType 
      Caption         =   "VOL: Reference Price Type (1 or 2)"
      Height          =   255
      Left            =   8400
      TabIndex        =   112
      Top             =   4800
      Width           =   2595
   End
   Begin VB.Label labelContinuousUpdate 
      Caption         =   "VOL: Continuous Update"
      Height          =   255
      Left            =   8400
      TabIndex        =   110
      Top             =   4440
      Width           =   1935
   End
   Begin VB.Label labelDeltaNeutralOrderType 
      Caption         =   "VOL: Hedge Delta Order Type"
      Height          =   255
      Left            =   8400
      TabIndex        =   91
      Top             =   840
      Width           =   2415
   End
   Begin VB.Label labelVolatilityType 
      Caption         =   "VOL: Volatility Type (1 or 2)"
      Height          =   255
      Left            =   8400
      TabIndex        =   89
      Top             =   480
      Width           =   2055
   End
   Begin VB.Label labelVolatility 
      Caption         =   "VOL: Volatility"
      Height          =   255
      Left            =   8400
      TabIndex        =   87
      Top             =   120
      Width           =   1995
   End
   Begin VB.Label labelOverridePercentageConstraints 
      Caption         =   "Override Percentage Constraints"
      Height          =   255
      Left            =   3960
      TabIndex        =   55
      Top             =   3000
      Width           =   2595
   End
   Begin VB.Label labelRule80A 
      Caption         =   "Rule 80 A"
      Height          =   255
      Left            =   240
      TabIndex        =   32
      Top             =   5880
      Width           =   1095
   End
   Begin VB.Label labelSettlingFirm 
      Caption         =   "Settling Firm"
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   1560
      Width           =   1095
   End
   Begin VB.Label labelMinQty 
      Caption         =   "Minimum Quantity"
      Height          =   255
      Left            =   3960
      TabIndex        =   45
      Top             =   1200
      Width           =   1815
   End
   Begin VB.Label labelPercentOffset 
      Caption         =   "Percent Offset"
      Height          =   255
      Left            =   3960
      TabIndex        =   47
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Label labelETradeOnly 
      Caption         =   "Electronic Exchange Only"
      Height          =   255
      Left            =   3960
      TabIndex        =   49
      Top             =   1920
      Width           =   1935
   End
   Begin VB.Label labelFirmQuoteOnly 
      Caption         =   "Firm Quote Only"
      Height          =   255
      Left            =   3960
      TabIndex        =   51
      Top             =   2280
      Width           =   1575
   End
   Begin VB.Label labelNBBOPriceCap 
      Caption         =   "NBBO Price Cap"
      Height          =   255
      Left            =   3960
      TabIndex        =   53
      Top             =   2640
      Width           =   1575
   End
   Begin VB.Label labelAuctionStrategy 
      Caption         =   "BOX: Auction Strategy"
      Height          =   255
      Left            =   3960
      TabIndex        =   69
      Top             =   5520
      Width           =   1695
   End
   Begin VB.Label labelStartingPrice 
      Caption         =   "BOX: Starting Price"
      Height          =   255
      Left            =   3960
      TabIndex        =   71
      Top             =   5880
      Width           =   1695
   End
   Begin VB.Label labelStockRefPrice 
      Caption         =   "BOX: Stock Ref Price"
      Height          =   255
      Left            =   3960
      TabIndex        =   73
      Top             =   6240
      Width           =   1695
   End
   Begin VB.Label labelDelta 
      Caption         =   "BOX: Delta"
      Height          =   255
      Left            =   3960
      TabIndex        =   75
      Top             =   6600
      Width           =   1095
   End
   Begin VB.Label labelStockRangeLower 
      Caption         =   "BOX/VOL: Stock Range Lower"
      Height          =   255
      Left            =   3960
      TabIndex        =   77
      Top             =   6960
      Width           =   2355
   End
   Begin VB.Label labelStockRangeUpper 
      Caption         =   "BOX/VOL: Stock Range Upper"
      Height          =   255
      Left            =   3960
      TabIndex        =   79
      Top             =   7320
      Width           =   2355
   End
   Begin VB.Label labelAllOrNone 
      Caption         =   "All or None"
      Height          =   255
      Left            =   3960
      TabIndex        =   43
      Top             =   840
      Width           =   1095
   End
   Begin VB.Label labelOcaType 
      Caption         =   "OCA type"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   840
      Width           =   975
   End
   Begin VB.Label labelShortSaleSlot 
      Caption         =   "Short Sales Slot"
      Height          =   255
      Left            =   3960
      TabIndex        =   67
      Top             =   5160
      Width           =   1455
   End
   Begin VB.Label labelDesignatedLocation 
      Caption         =   "Designated Location"
      Height          =   255
      Left            =   240
      TabIndex        =   28
      Top             =   5160
      Width           =   1695
   End
   Begin VB.Label labelDiscretionaryAmt 
      Caption         =   "Discretionary Amt"
      Height          =   255
      Left            =   3960
      TabIndex        =   65
      Top             =   4800
      Width           =   1455
   End
   Begin VB.Label labelHidden 
      Caption         =   "Hidden"
      Height          =   255
      Left            =   3960
      TabIndex        =   63
      Top             =   4440
      Width           =   975
   End
   Begin VB.Label labelOutsideRth 
      Caption         =   "Outside RTH"
      Height          =   255
      Left            =   3960
      TabIndex        =   61
      Top             =   4080
      Width           =   1215
   End
   Begin VB.Label labelTriggerMethod 
      Caption         =   "Trigger Method"
      Height          =   255
      Left            =   3960
      TabIndex        =   59
      Top             =   3720
      Width           =   1095
   End
   Begin VB.Label labelDisplaySize 
      Caption         =   "Display Size"
      Height          =   255
      Left            =   3960
      TabIndex        =   57
      Top             =   3360
      Width           =   975
   End
   Begin VB.Label labelSweepToFill 
      Caption         =   "Sweep to Fill"
      Height          =   255
      Left            =   240
      TabIndex        =   26
      Top             =   4800
      Width           =   975
   End
   Begin VB.Label labelBlockOrder 
      Caption         =   "Block Order"
      Height          =   255
      Left            =   240
      TabIndex        =   24
      Top             =   4440
      Width           =   975
   End
   Begin VB.Label labelTransmit 
      Caption         =   "Transmit"
      Height          =   255
      Left            =   240
      TabIndex        =   22
      Top             =   4080
      Width           =   975
   End
   Begin VB.Label labelParentId 
      Caption         =   "Parent Id"
      Height          =   255
      Left            =   240
      TabIndex        =   20
      Top             =   3720
      Width           =   975
   End
   Begin VB.Label labelOrderRef 
      Caption         =   "Order Ref"
      Height          =   255
      Left            =   240
      TabIndex        =   18
      Top             =   3360
      Width           =   975
   End
   Begin VB.Label labelOrigin 
      Caption         =   "Origin"
      Height          =   255
      Left            =   240
      TabIndex        =   16
      Top             =   3000
      Width           =   975
   End
   Begin VB.Label labelOpenClose 
      Caption         =   "Open/Close"
      Height          =   255
      Left            =   240
      TabIndex        =   14
      Top             =   2640
      Width           =   975
   End
   Begin VB.Label labelAccount 
      Caption         =   "Account"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label labelOCA 
      Caption         =   "OCA group"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   480
      Width           =   975
   End
   Begin VB.Label labelTIF 
      Caption         =   "Time in Force"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   975
   End
End
Attribute VB_Name = "dlgOrderAttribs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ========================================================
' Member variables
' ========================================================
Private m_orderInfo As TWSLib.IOrder
Private m_mainWnd As dlgMainWnd

Private m_ok As Boolean

' ========================================================
' Public Methods
' ========================================================
Public Sub init(ByRef mainWin As Form, ByVal orderInfo As TWSLib.IOrder)

    Set m_mainWnd = dlgMainWnd
    Set m_orderInfo = orderInfo
    
    m_ok = False
    
    txtTIF.text = m_orderInfo.timeInForce
    txtActiveStartTime.text = m_orderInfo.activeStartTime
    txtActiveStopTime.text = m_orderInfo.activeStopTime
    txtOCA.text = m_orderInfo.ocaGroup
    txtOcaType.text = m_orderInfo.ocaType
    txtOrderRef.text = m_orderInfo.orderRef
    txtTransmit.text = m_orderInfo.transmit
    txtParentId.text = m_orderInfo.parentId
    txtBlockOrder.text = m_orderInfo.blockOrder
    txtSweepToFill.text = m_orderInfo.sweepToFill
    txtDisplaySize.text = m_orderInfo.displaySize
    txtTriggerMethod.text = m_orderInfo.triggerMethod
    txtOutsideRth.text = m_orderInfo.outsideRth
    txtHidden.text = m_orderInfo.Hidden
    txtOverridePercentageConstraints.text = m_orderInfo.overridePercentageConstraints
    txtRule80A.text = m_orderInfo.rule80A
    txtAllOrNone.text = m_orderInfo.allOrNone
    txtMinQty.text = ivalStr(m_orderInfo.minQty)
    txtPercentOffset.text = dvalStr(m_orderInfo.percentOffset)
    txtTrailStopPrice.text = dvalStr(m_orderInfo.trailStopPrice)
    txtTrailingPercent.text = dvalStr(m_orderInfo.trailingPercent)
    
    ' Institutional orders only
    txtOpenClose.text = m_orderInfo.openClose
    txtOrigin.text = m_orderInfo.origin
    txtShortSaleSlot.text = m_orderInfo.shortSaleSlot
    txtDesignatedLocation.text = m_orderInfo.designatedLocation
    txtExemptCode.text = m_orderInfo.exemptCode

    'SMART routing only
    txtDiscretionaryAmt.text = m_orderInfo.discretionaryAmt
    txtETradeOnly.text = m_orderInfo.eTradeOnly
    txtFirmQuoteOnly.text = m_orderInfo.firmQuoteOnly
    txtNBBOPriceCap.text = dvalStr(m_orderInfo.nbboPriceCap)
    checkOptOutSmartRouting.value = m_orderInfo.optOutSmartRouting
    
    ' BOX or VOL orders only
    txtAuctionStrategy.text = m_orderInfo.auctionStrategy
    
    'BOX orders only
    txtStartingPrice.text = dvalStr(m_orderInfo.startingPrice)
    txtStockRefPrice.text = dvalStr(m_orderInfo.stockRefPrice)
    txtDelta.text = dvalStr(m_orderInfo.delta)
    
    ' pegged to stock or VOL orders
    txtStockRangeLower.text = dvalStr(m_orderInfo.stockRangeLower)
    txtStockRangeUpper.text = dvalStr(m_orderInfo.stockRangeUpper)
    
    ' VOLATILITY orders only
    txtVolatility.text = dvalStr(m_orderInfo.volatility)
    txtVolatilityType.text = ivalStr(m_orderInfo.volatilityType)
    txtContinuousUpdate.text = m_orderInfo.continuousUpdate
    txtReferencePriceType.text = ivalStr(m_orderInfo.referencePriceType)
    txtDeltaNeutralOrderType.text = m_orderInfo.deltaNeutralOrderType
    txtDeltaNeutralAuxPrice.text = dvalStr(m_orderInfo.deltaNeutralAuxPrice)
    txtDeltaNeutralConId.text = ivalStr(m_orderInfo.deltaNeutralConId)
    txtDeltaNeutralSettlingFirm.text = m_orderInfo.deltaNeutralSettlingFirm
    txtDeltaNeutralClearingAccount.text = m_orderInfo.deltaNeutralClearingAccount
    txtDeltaNeutralClearingIntent.text = m_orderInfo.deltaNeutralClearingIntent
    txtDeltaNeutralOpenClose.text = m_orderInfo.deltaNeutralOpenClose
    checkDeltaNeutralShortSale.value = m_orderInfo.deltaNeutralShortSale
    txtDeltaNeutralShortSaleSlot.text = ivalStr(m_orderInfo.deltaNeutralShortSaleSlot)
    txtDeltaNeutralDesignatedLocation.text = m_orderInfo.deltaNeutralDesignatedLocation
    
    ' SCALE orders only
    txtScaleInitLevelSize.text = ivalStr(m_orderInfo.scaleInitLevelSize)
    txtScaleSubsLevelSize.text = ivalStr(m_orderInfo.scaleSubsLevelSize)
    txtScalePriceIncr.text = dvalStr(m_orderInfo.scalePriceIncrement)
    txtScalePriceAdjustValue.Text = dvalStr(m_orderInfo.scalePriceAdjustValue)
    txtScalePriceAdjustInterval.Text = ivalStr(m_orderInfo.scalePriceAdjustInterval)
    txtScaleProfitOffset.Text = dvalStr(m_orderInfo.scaleProfitOffset)
    checkScaleAutoReset.value = m_orderInfo.scaleAutoReset
    txtScaleInitPosition.Text = ivalStr(m_orderInfo.scaleInitPosition)
    txtScaleInitFillQty.Text = ivalStr(m_orderInfo.scaleInitFillQty)
    checkScaleRandomPercent.value = m_orderInfo.scaleRandomPercent
    txtScaleTable.text = m_orderInfo.scaleTable
    
    ' HEDGE orders only
    txtHedgeType.text = m_orderInfo.hedgeType
    txtHedgeParam.text = m_orderInfo.hedgeParam
    
    ' Clearing info
    txtAccount.text = m_orderInfo.account
    txtSettlingFirm.text = m_orderInfo.settlingFirm
    txtClearingAccount.text = m_orderInfo.clearingAccount
    txtClearingIntent.text = m_orderInfo.clearingIntent
    
End Sub

' ========================================================
' Get/Set Methods
' ========================================================
Public Property Get ok() As Boolean
    ok = m_ok
End Property

Private Function ivalStr(ByVal val As Long) As String
    If val = m_mainWnd.m_maxLong Then
        ivalStr = ""
    Else
        ivalStr = val
    End If
End Function
Private Function dvalStr(ByVal val As Double) As String
    If val = m_mainWnd.m_maxDouble Then
        dvalStr = ""
    Else
        dvalStr = val
    End If
End Function
Private Function bval(ByVal text As String) As Long
    If Len(text) = 0 Then
        bval = False
    Else
        bval = text
    End If
End Function

Private Function ival(ByVal text As String) As Long
    If Len(text) = 0 Then
        ival = m_mainWnd.m_maxLong
    Else
        ival = text
    End If
End Function
Private Function dval(ByVal text As String) As Double
    If Len(text) = 0 Then
        dval = m_mainWnd.m_maxDouble
    Else
        dval = text
    End If
End Function
' ========================================================
' Button Events
' ========================================================
Private Sub cmdOK_Click()

    m_orderInfo.timeInForce = txtTIF.text
    m_orderInfo.activeStartTime = txtActiveStartTime.text
    m_orderInfo.activeStopTime = txtActiveStopTime.text
    m_orderInfo.ocaGroup = txtOCA.text
    m_orderInfo.ocaType = ival(txtOcaType.text)
    m_orderInfo.orderRef = txtOrderRef.text
    m_orderInfo.transmit = bval(txtTransmit.text)
    m_orderInfo.parentId = ival(txtParentId.text)
    m_orderInfo.blockOrder = bval(txtBlockOrder.text)
    m_orderInfo.sweepToFill = bval(txtSweepToFill.text)
    m_orderInfo.displaySize = ival(txtDisplaySize.text)
    m_orderInfo.triggerMethod = txtTriggerMethod.text
    m_orderInfo.outsideRth = bval(txtOutsideRth.text)
    m_orderInfo.Hidden = txtHidden.text
    m_orderInfo.overridePercentageConstraints = bval(txtOverridePercentageConstraints.text)
    m_orderInfo.rule80A = txtRule80A.text
    m_orderInfo.allOrNone = bval(txtAllOrNone.text)
    m_orderInfo.minQty = ival(txtMinQty.text)
    m_orderInfo.percentOffset = dval(txtPercentOffset.text)
    m_orderInfo.trailStopPrice = dval(txtTrailStopPrice.text)
    m_orderInfo.trailingPercent = dval(txtTrailingPercent.text)
    
    ' Institutional orders only
    m_orderInfo.openClose = txtOpenClose.text
    m_orderInfo.origin = ival(txtOrigin.text)
    m_orderInfo.shortSaleSlot = ival(txtShortSaleSlot.text)
    m_orderInfo.designatedLocation = txtDesignatedLocation.text
    If txtExemptCode.text <> "" Then
        m_orderInfo.exemptCode = ival(txtExemptCode.text)
    Else
        m_orderInfo.exemptCode = ival("-1")
    End If

    'SMART routing only
    m_orderInfo.discretionaryAmt = dval(txtDiscretionaryAmt.text)
    m_orderInfo.eTradeOnly = bval(txtETradeOnly.text)
    m_orderInfo.firmQuoteOnly = bval(txtFirmQuoteOnly.text)
    m_orderInfo.nbboPriceCap = dval(txtNBBOPriceCap.text)
    m_orderInfo.optOutSmartRouting = checkOptOutSmartRouting.value
    
    ' BOX or VOL orders only
    m_orderInfo.auctionStrategy = ival(txtAuctionStrategy.text)
    
    'BOX orders only
    m_orderInfo.startingPrice = dval(txtStartingPrice.text)
    m_orderInfo.stockRefPrice = dval(txtStockRefPrice.text)
    m_orderInfo.delta = dval(txtDelta.text)
    
    ' pegged to stock or VOL orders
    m_orderInfo.stockRangeLower = dval(txtStockRangeLower.text)
    m_orderInfo.stockRangeUpper = dval(txtStockRangeUpper.text)
    
    ' VOLATILITY orders only
    m_orderInfo.volatility = dval(txtVolatility.text)
    m_orderInfo.volatilityType = ival(txtVolatilityType.text)
    m_orderInfo.continuousUpdate = bval(txtContinuousUpdate.text)
    m_orderInfo.referencePriceType = ival(txtReferencePriceType.text)
    m_orderInfo.deltaNeutralOrderType = txtDeltaNeutralOrderType.text
    m_orderInfo.deltaNeutralAuxPrice = dval(txtDeltaNeutralAuxPrice.text)
    m_orderInfo.deltaNeutralConId = ival(txtDeltaNeutralConId.text)
    m_orderInfo.deltaNeutralSettlingFirm = txtDeltaNeutralSettlingFirm.text
    m_orderInfo.deltaNeutralClearingAccount = txtDeltaNeutralClearingAccount.text
    m_orderInfo.deltaNeutralClearingIntent = txtDeltaNeutralClearingIntent.text
    m_orderInfo.deltaNeutralOpenClose = txtDeltaNeutralOpenClose.text
    m_orderInfo.deltaNeutralShortSale = checkDeltaNeutralShortSale.value
    m_orderInfo.deltaNeutralShortSaleSlot = ival(txtDeltaNeutralShortSaleSlot.text)
    m_orderInfo.deltaNeutralDesignatedLocation = txtDeltaNeutralDesignatedLocation.text
    
    ' SCALE orders only
    m_orderInfo.scaleInitLevelSize = ival(txtScaleInitLevelSize.text)
    m_orderInfo.scaleSubsLevelSize = ival(txtScaleSubsLevelSize.text)
    m_orderInfo.scalePriceIncrement = dval(txtScalePriceIncr.text)
    m_orderInfo.scalePriceAdjustValue = dval(txtScalePriceAdjustValue.Text)
    m_orderInfo.scalePriceAdjustInterval = ival(txtScalePriceAdjustInterval.Text)
    m_orderInfo.scaleProfitOffset = dval(txtScaleProfitOffset.Text)
    m_orderInfo.scaleAutoReset = checkScaleAutoReset.value
    m_orderInfo.scaleInitPosition = ival(txtScaleInitPosition.Text)
    m_orderInfo.scaleInitFillQty = ival(txtScaleInitFillQty.Text)
    m_orderInfo.scaleRandomPercent = checkScaleRandomPercent.value
    m_orderInfo.scaleTable = txtScaleTable.text
    
    ' HEDGE orders only
    m_orderInfo.hedgeType = txtHedgeType.text
    m_orderInfo.hedgeParam = txtHedgeParam.text
    
    ' Institutional orders only
    m_orderInfo.account = txtAccount.text
    m_orderInfo.settlingFirm = txtSettlingFirm.text
    m_orderInfo.clearingAccount = txtClearingAccount.text
    m_orderInfo.clearingIntent = txtClearingIntent.text
    
    m_ok = True
    Hide
End Sub

Private Sub cmdCancel_Click()
    m_ok = False
    Hide
End Sub

