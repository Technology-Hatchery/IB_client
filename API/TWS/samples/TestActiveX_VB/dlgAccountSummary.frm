' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgAccountSummary 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Account Summary"
   ClientHeight    =   2160
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   3555
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2160
   ScaleWidth      =   3555
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtReqId 
      Height          =   285
      Left            =   1800
      TabIndex        =   0
      Text            =   "0"
      Top             =   240
      Width           =   1455
   End
   Begin VB.TextBox txtGroupName 
      Height          =   285
      Left            =   1800
      TabIndex        =   1
      Text            =   "All"
      Top             =   720
      Width           =   1455
   End
   Begin VB.TextBox txtTags 
      Height          =   285
      Left            =   1800
      TabIndex        =   2
      Text            =   "AccruedCash,BuyingPower,NetLiquidation"
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1965
      TabIndex        =   4
      Top             =   1680
      Width           =   1095
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   645
      TabIndex        =   3
      Top             =   1680
      Width           =   1095
   End
   Begin VB.Label lblReqId 
      Caption         =   "Request Id"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   975
   End
   Begin VB.Label lblGroupName 
      Caption         =   "Group Name"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   720
      Width           =   975
   End
   Begin VB.Label lblTags 
      Caption         =   "Tags"
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   1200
      Width           =   1455
   End
End

Attribute VB_Name = "dlgAccountSummary"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

' ========================================================
' Dialog Types
' ========================================================
Public Enum Acct_Summ_Dlg_Type
    REQUEST_ACCOUNT_SUMMARY = 1
    CANCEL_ACCOUNT_SUMMARY
End Enum

' ========================================================
' Member variables
' ========================================================
Private m_arrDlgTitles As New Collection
Private m_reqId As Integer
Private m_groupName As String
Private m_tags As String
Private m_ok As Boolean

' ========================================================
' Get/Set Methods
' ========================================================
Public Property Get reqId() As Integer
    reqId = m_reqId
End Property

Public Property Get groupName() As String
    groupName = m_groupName
End Property

Public Property Get tags() As String
    tags = m_tags
End Property

Public Property Get ok() As Boolean
    ok = m_ok
End Property

' ========================================================
' Public Methods
' ========================================================

' --------------------------------------------------------
' Sets the dialog field and button states based on the dialog type
' --------------------------------------------------------
Public Sub init(ByRef dlgType As Acct_Summ_Dlg_Type)
    m_ok = False
    
    Caption = m_arrDlgTitles.Item(dlgType)
    
    txtReqId.Enabled = True
    txtGroupName.Enabled = (dlgType = REQUEST_ACCOUNT_SUMMARY)
    txtTags.Enabled = (dlgType = REQUEST_ACCOUNT_SUMMARY)
End Sub

'---------------------------------------------------------
' Set the various dialog title string for each dialog type and the initial dialog data.
'---------------------------------------------------------
Private Sub Form_Initialize()
    m_arrDlgTitles.Add "Request Account Summary"
    m_arrDlgTitles.Add "Cancel Account Summary"
End Sub

' ========================================================
' Button Events
' ========================================================
Private Sub cmdOk_Click()
    m_reqId = Text2Int(txtReqId.text)
    m_groupName = txtGroupName.text
    m_tags = txtTags.text
        
    m_ok = True
    Me.Hide
End Sub

Private Sub cmdCancel_Click()
    m_ok = False
    Me.Hide
End Sub

Private Sub Form_Load()
    m_reqId = 0
End Sub

Private Function Text2Int(ByRef text As String) As Integer
    If Len(text) <= 0 Then
       Text2Int = 0
    Else
       Text2Int = text
    End If
End Function