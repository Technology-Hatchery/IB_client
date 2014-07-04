' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgAcctData 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Account Update"
   ClientHeight    =   5880
   ClientLeft      =   4725
   ClientTop       =   5115
   ClientWidth     =   10005
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5880
   ScaleWidth      =   10005
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtLastUpdateTime 
      Height          =   285
      Left            =   1560
      TabIndex        =   6
      Text            =   "00:00"
      Top             =   5280
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Caption         =   "Portfolio Data"
      Height          =   2055
      Left            =   120
      TabIndex        =   3
      Top             =   2880
      Width           =   9735
      Begin VB.ListBox lstPortfolioData 
         Height          =   1425
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   9495
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Key, Value, and Currency"
      Height          =   2415
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   9735
      Begin VB.ListBox lstKeyValueData 
         Height          =   1815
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   9495
      End
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   375
      Left            =   4395
      TabIndex        =   0
      Top             =   5280
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Last update time :"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   5280
      Width           =   1335
   End
End
Attribute VB_Name = "dlgAcctData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private m_utils As Utils

Private m_accountName As String
Private m_complete As Boolean

' ========================================================
' Button Events
' ========================================================
Private Sub cmdClose_Click()
    ' clear any existing list details
    lstKeyValueData.clear
    lstPortfolioData.clear
    txtLastUpdateTime = "00:00"
    
    Hide
End Sub

' ========================================================
' Public methods
' ========================================================
'--------------------------------------------------------------------------------
' Class initializer. Make utilites available to this class
'--------------------------------------------------------------------------------
Public Sub init(ByVal utilities As Utils)
    Set m_utils = utilities
End Sub

'--------------------------------------------------------------------------------
' Updates a user account property
'--------------------------------------------------------------------------------
Public Sub updateAccountValue(key As String, val As String, curency As String, _
    accountName As String)
    Dim msg As String

    msg = "key=" & key & " value=" & val & " currency=" & curency _
        & " account=" & accountName
    Call m_utils.addListItem(ACCOUNT_DATA, msg)
End Sub

'--------------------------------------------------------------------------------
' Updates a portfolio position details
'--------------------------------------------------------------------------------
Public Sub updatePortfolio(contract As TWSLib.IContract, Position As Long, _
        marketPrice As Double, marketValue As Double, averageCost As Double, _
        unrealizedPNL As Double, realizedPNL As Double, accountName As String)

    Dim msg As String
    
    With contract
        msg = "conId=" & .conId & " symbol=" & .symbol & " secType=" & .secType & " expiry=" & .expiry & " strike=" & .strike _
            & " right=" & .Right & " multiplier=" & .multiplier & " primaryExch=" & .primaryExchange & " currency=" & .Currency _
            & " localSymbol=" & .localSymbol & " tradingClass=" & .tradingClass & " position=" & Position & " mktPrice=" & marketPrice & " mktValue=" & marketValue _
            & " avgCost=" & averageCost & " unrealizedPNL=" & unrealizedPNL & " realizedPNL=" & realizedPNL & " account=" & accountName
    End With

    Call m_utils.addListItem(PORTFOLIO_DATA, msg)
End Sub
    
'--------------------------------------------------------------------------------
' Updates the server clock time
'--------------------------------------------------------------------------------
Public Sub updateAccountTime(timeStamp As String)
    txtLastUpdateTime.text = timeStamp
End Sub

Public Sub accountDownloadBegin(accountName As String)
    m_accountName = accountName
    m_complete = False
    Call updateTitle
End Sub

Public Sub accountDownloadEnd(accountName As String)
    If Len(m_accountName) <> 0 And m_accountName <> accountName Then
       Return
    End If
    
    m_complete = True
    Call updateTitle
End Sub

Private Sub updateTitle()

    Dim title As String
    title = ""

    If Len(m_accountName) <> 0 Then
        title = m_accountName
    End If
    If m_complete Then
        If Len(title) <> 0 Then
            title = title & " "
        End If
        title = title & "[complete]"
    End If

    Me.Caption = title

End Sub

