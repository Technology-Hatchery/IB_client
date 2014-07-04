' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgAcctUpdates 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Account Updates (FA customers only)"
   ClientHeight    =   2775
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   3855
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2775
   ScaleWidth      =   3855
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   1935
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   3615
      Begin VB.CommandButton cmdUnSubscribe 
         Caption         =   "UnSubscribe"
         Height          =   375
         Left            =   2040
         TabIndex        =   4
         Top             =   1440
         Width           =   1335
      End
      Begin VB.CommandButton cmdSubscribe 
         Caption         =   "Subscribe"
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   1440
         Width           =   1335
      End
      Begin VB.TextBox txtAcctCode 
         Height          =   285
         Left            =   1680
         TabIndex        =   2
         Top             =   960
         Width           =   1815
      End
      Begin VB.Label Label2 
         Caption         =   "Account Code :"
         Height          =   255
         Left            =   240
         TabIndex        =   1
         Top             =   960
         Width           =   1215
      End
      Begin VB.Label Label1 
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Enter the account code for the FA managed account you wish to receive updates for : "
         Height          =   495
         Left            =   120
         TabIndex        =   0
         Top             =   240
         Width           =   3375
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1320
      TabIndex        =   6
      Top             =   2280
      Width           =   1215
   End
End
Attribute VB_Name = "dlgAcctUpdates"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ===============================================================================
' Private Members
' ===============================================================================
Private m_acctCode As String
Private m_subscribe As Boolean
Private m_ok As Boolean

' ===============================================================================
' Get/Set Properties
' ===============================================================================
Public Property Get acctCode() As String
    acctCode = m_acctCode
End Property

Public Property Get subscribe() As Boolean
    subscribe = m_subscribe
End Property

Public Property Get ok() As Boolean
    ok = m_ok
End Property

' ========================================================
' Button Events
' ========================================================
Private Sub cmdSubscribe_Click()
    m_acctCode = txtAcctCode.text
    m_subscribe = True
    m_ok = True
    Me.Hide
End Sub

Private Sub cmdUnSubscribe_Click()
    m_acctCode = txtAcctCode.text
    m_subscribe = False
    m_ok = True
    Me.Hide
End Sub

Private Sub cmdCancel_Click()
    m_acctCode = ""
    m_ok = False
    Me.Hide
End Sub

