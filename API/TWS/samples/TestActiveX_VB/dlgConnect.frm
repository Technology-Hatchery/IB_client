' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgConnect 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Connection Parameters"
   ClientHeight    =   3375
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4200
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3375
   ScaleWidth      =   4200
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   893
      TabIndex        =   3
      Top             =   2880
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2213
      TabIndex        =   4
      Top             =   2880
      Width           =   1095
   End
   Begin VB.TextBox txtPort 
      Height          =   285
      Left            =   240
      TabIndex        =   1
      Text            =   "7496"
      Top             =   1440
      Width           =   3615
   End
   Begin VB.TextBox txtClientId 
      Height          =   285
      Left            =   240
      TabIndex        =   2
      Text            =   "0"
      Top             =   2280
      Width           =   3615
   End
   Begin VB.TextBox txtHostIP 
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Top             =   600
      Width           =   3615
   End
   Begin VB.Label Label3 
      Caption         =   "Client ID"
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   2040
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "Port"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   1200
      Width           =   615
   End
   Begin VB.Label Label1 
      Caption         =   "IP Address (leave blank for local host)"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   2895
   End
End
Attribute VB_Name = "dlgConnect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ===============================================================================
' Private Members
' ===============================================================================
Private m_hostIP As String
Private m_port As Long
Private m_clientId As Long
Private m_ok As Boolean

' ===============================================================================
' Get/Set Properties
' ===============================================================================
Public Property Get hostIP() As String
    hostIP = m_hostIP
End Property

Public Property Get port() As Long
    port = m_port
End Property

Public Property Get clientId() As Long
    clientId = m_clientId
End Property

Public Property Get ok() As Boolean
    ok = m_ok
End Property

' ========================================================
' Button Events
' ========================================================
Private Sub cmdOK_Click()
    m_hostIP = txtHostIP.text
    m_port = txtPort.text
    m_clientId = txtClientId.text
    m_ok = True
    
    Hide
End Sub

Private Sub cmdCancel_Click()
    m_ok = False
    Hide
End Sub

