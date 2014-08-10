' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgLogConfig 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Log Configuration"
   ClientHeight    =   1740
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   3360
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1740
   ScaleWidth      =   3360
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Caption         =   "TWS Server"
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   3135
      Begin VB.ComboBox cmbServerLogLevel 
         Height          =   315
         Left            =   1200
         TabIndex        =   3
         Text            =   "Combo1"
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "Log Level :"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   480
         Width           =   975
      End
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1733
      TabIndex        =   1
      Top             =   1200
      Width           =   975
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   653
      TabIndex        =   0
      Top             =   1200
      Width           =   975
   End
End
Attribute VB_Name = "dlgLogConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ===============================================================================
' Public Members
' ===============================================================================
Public Enum LOG_LEVEL
    Sys = 1
    Err
    Warn
    Info
    Detail
End Enum

' ===============================================================================
' Private Members
' ===============================================================================
Private m_serverLogLevel As Long
Private m_ok As Boolean

' ===============================================================================
' Get/Set Properties
' ===============================================================================
Public Property Get serverLogLevel() As Long
    serverLogLevel = m_serverLogLevel
End Property

Public Property Get ok() As Boolean
    ok = m_ok
End Property

' ========================================================
' Private Methods
' ========================================================
Private Sub Form_Load()
    cmbServerLogLevel.AddItem ("System")
    cmbServerLogLevel.AddItem ("Error")
    cmbServerLogLevel.AddItem ("Warning")
    cmbServerLogLevel.AddItem ("Information")
    cmbServerLogLevel.AddItem ("Detail")
    
    cmbServerLogLevel.ListIndex = LOG_LEVEL.Err - 1 ' Dfault TWS log level is ERROR
End Sub

' ========================================================
' Button Events
' ========================================================
Private Sub OKButton_Click()
    m_serverLogLevel = cmbServerLogLevel.ListIndex + 1
    m_ok = True
    
    Hide
End Sub

Private Sub CancelButton_Click()
    m_ok = False
    Hide
End Sub
