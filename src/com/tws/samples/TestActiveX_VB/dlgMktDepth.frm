' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form dlgMktDepth 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Market Depth for: "
   ClientHeight    =   2595
   ClientLeft      =   5985
   ClientTop       =   6240
   ClientWidth     =   10260
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2595
   ScaleWidth      =   10260
   ShowInTaskbar   =   0   'False
   Begin MSFlexGridLib.MSFlexGrid grdBidBookEntries 
      CausesValidation=   0   'False
      Height          =   1755
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   3096
      _Version        =   393216
      Rows            =   0
      Cols            =   5
      FixedRows       =   0
      FixedCols       =   0
      AllowBigSelection=   0   'False
      ScrollTrack     =   -1  'True
      FocusRect       =   0
      HighLight       =   0
      ScrollBars      =   2
      Appearance      =   0
   End
   Begin VB.CommandButton btnClose 
      Caption         =   "Close"
      Height          =   375
      Left            =   4560
      TabIndex        =   0
      Top             =   2160
      Width           =   1215
   End
   Begin MSFlexGridLib.MSFlexGrid grdAskBookEntries 
      CausesValidation=   0   'False
      Height          =   1755
      Left            =   5160
      TabIndex        =   2
      Top             =   360
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   3096
      _Version        =   393216
      Rows            =   0
      Cols            =   5
      FixedRows       =   0
      FixedCols       =   0
      AllowBigSelection=   0   'False
      ScrollTrack     =   -1  'True
      FocusRect       =   0
      HighLight       =   0
      ScrollBars      =   2
      Appearance      =   0
   End
   Begin VB.Label Label2 
      Caption         =   "Ask"
      Height          =   255
      Left            =   7440
      TabIndex        =   4
      Top             =   120
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "Bid"
      Height          =   255
      Left            =   2520
      TabIndex        =   3
      Top             =   120
      Width           =   495
   End
End
Attribute VB_Name = "dlgMktDepth"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'================================================================================
' Private Members
'================================================================================
' enums
Enum Operation_Type
    OPERATION_INSERT = 0
    OPERATION_UPDATE = 1
    OPERATION_DELETE = 2
End Enum

Enum side
    ASK = 0
    BID = 1
End Enum

' member variables
Private m_ok As Boolean

'================================================================================
' Button Events
'================================================================================
Private Sub btnClose_Click()
    m_ok = False
    Unload Me
End Sub

'================================================================================
' Public Methods
' ===============================================================================
'--------------------------------------------------------------------------------
' Adds the market depth row to the book
'--------------------------------------------------------------------------------
Public Sub updateMktDepth(ByVal tickerId As Long, ByVal rowId As Long, ByVal marketMaker As String, _
        ByVal operation As Long, ByVal side As Long, ByVal price As Double, ByVal size As Long)
    Dim theRow As Long
    Dim bookentry As String
    theRow = rowId + 1
    If operation = OPERATION_INSERT Then
        bookentry = marketMaker & vbTab & price & vbTab & size & vbTab & "0.0" & vbTab & "0"
        If side = BID Then
           grdBidBookEntries.AddItem bookentry, theRow
        Else
           grdAskBookEntries.AddItem bookentry, theRow
        End If
    ElseIf operation = OPERATION_UPDATE Then
        If side = BID Then
           grdBidBookEntries.row = theRow
           grdBidBookEntries.Col = 0
           grdBidBookEntries.text = marketMaker
           grdBidBookEntries.Col = 1
           grdBidBookEntries.text = price
           grdBidBookEntries.Col = 2
           grdBidBookEntries.text = size
        Else
           grdAskBookEntries.row = theRow
           grdAskBookEntries.Col = 0
           grdAskBookEntries.text = marketMaker
           grdAskBookEntries.Col = 1
           grdAskBookEntries.text = price
           grdAskBookEntries.Col = 2
           grdAskBookEntries.text = size
        End If
    ElseIf operation = OPERATION_DELETE Then
        If side = BID Then
           grdBidBookEntries.RemoveItem theRow
        Else
           grdAskBookEntries.RemoveItem theRow
        End If
    End If
    
    ' recalc the average cost and cumulative size where they could have changed
    If side = BID Then
        Call UpdateList(grdBidBookEntries, theRow)
    Else
        Call UpdateList(grdAskBookEntries, theRow)
    End If
End Sub
Private Sub subClear(ByVal lstBookEntries As MSFlexGrid)
    Dim iLoop As Long
    For iLoop = lstBookEntries.Rows - 1 To 1 Step -1
        lstBookEntries.RemoveItem (iLoop)
    Next
End Sub
Public Sub clear()
    Call subClear(grdAskBookEntries)
    Call subClear(grdBidBookEntries)
End Sub

'--------------------------------------------------------------------------------
' Flush the deep book
'--------------------------------------------------------------------------------
Private Sub Form_Load()
    Dim bookentry As String
    
    ' flush the book entries and add the column headers
    clear
    bookentry = "MM" & vbTab & "Price" & vbTab & "Size" & vbTab & "cumSize" & vbTab & "avgPrice"
    grdAskBookEntries.AddItem bookentry
    grdBidBookEntries.AddItem bookentry
End Sub
Private Sub UpdateList(ByVal lstBookEntries As MSFlexGrid, ByVal baseRow As Long)
    Dim size As Long, cumSize As Long
    Dim price As Double, totalPrice As Double
    Dim iLoop As Long
    
    totalPrice = 0
    cumSize = 0
    If baseRow > 1 And baseRow <= lstBookEntries.Rows - 1 Then
        lstBookEntries.row = baseRow - 1
        lstBookEntries.Col = 3
        cumSize = lstBookEntries.text
        lstBookEntries.Col = 4
        totalPrice = lstBookEntries.text * cumSize
    End If
    
    For iLoop = baseRow To lstBookEntries.Rows - 1
        lstBookEntries.row = iLoop
        lstBookEntries.Col = 1
        price = lstBookEntries.text
        lstBookEntries.Col = 2
        size = lstBookEntries.text
        cumSize = cumSize + size
        totalPrice = totalPrice + (price * size)
        lstBookEntries.row = iLoop
        lstBookEntries.Col = 3
        lstBookEntries.text = cumSize
        lstBookEntries.Col = 4
        lstBookEntries.text = Round(totalPrice / cumSize, 6)
    Next iLoop
    lstBookEntries.Refresh
End Sub
