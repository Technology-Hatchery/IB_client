' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgNewsBulletins 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "IB News Bulletin Subscription"
   ClientHeight    =   2190
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2190
   ScaleWidth      =   5565
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdSubscribe 
      Caption         =   "Subscribe"
      Height          =   375
      Left            =   1080
      TabIndex        =   4
      Top             =   1680
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Height          =   1335
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   5295
      Begin VB.OptionButton optAllMsgs 
         Caption         =   "receive all current day's messages and any new messages."
         Height          =   255
         Left            =   480
         TabIndex        =   6
         Top             =   840
         Width           =   4575
      End
      Begin VB.OptionButton optNewMsgs 
         Caption         =   "receive new messages only."
         Height          =   255
         Left            =   480
         TabIndex        =   5
         Top             =   480
         Width           =   3615
      End
      Begin VB.Label Label1 
         Caption         =   "When subscribing to IB news bulletins you have 2 options:"
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   4455
      End
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   375
      Left            =   4200
      TabIndex        =   1
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton cmdUnsubscribe 
      Caption         =   "UnSubscribe"
      Height          =   375
      Left            =   2400
      TabIndex        =   0
      Top             =   1680
      Width           =   1215
   End
End
Attribute VB_Name = "dlgNewsBulletins"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'================================================================================
' Private Members
'================================================================================
Private m_subscribe As Boolean
Private m_allMsgs As Boolean
Private m_ok As Boolean

' ========================================================
' Get/Set Methods
' ========================================================
Public Property Get subscribe() As Boolean
    subscribe = m_subscribe
End Property

Public Property Get allMsgs() As Boolean
    allMsgs = m_allMsgs
End Property

Public Property Get ok() As Boolean
    ok = m_ok
End Property

'================================================================================
' Button Events
'================================================================================

'--------------------------------------------------------------------------------
'   Aborts the news bulletin request and hides this dialog
'--------------------------------------------------------------------------------
Private Sub cmdClose_Click()
    m_ok = False
    Hide
End Sub

'--------------------------------------------------------------------------------
'   Subscribes to IB news bulletins. When subscribing users can get all the existing
'   days messages and will be notified of new messages
'--------------------------------------------------------------------------------
Private Sub cmdSubscribe_Click()
    m_ok = True
    m_subscribe = True
    m_allMsgs = (optAllMsgs.value = True)
    Hide
End Sub

'--------------------------------------------------------------------------------
'   Unsubscribes to news bulletins so users will not receive IB new bulletin
'   notifications.
'--------------------------------------------------------------------------------
Private Sub cmdUnSubscribe_Click()
    m_ok = True
    m_subscribe = False
    Hide
End Sub

'--------------------------------------------------------------------------------
'   Default to the 'new messages only' subscription option if not is specified.
'--------------------------------------------------------------------------------
Private Sub Form_Load()
    optNewMsgs.value = True
End Sub
