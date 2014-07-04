' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgSharesAlloc 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "FA Allocation Info"
   ClientHeight    =   3765
   ClientLeft      =   2835
   ClientTop       =   3480
   ClientWidth     =   6270
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2224.486
   ScaleMode       =   0  'User
   ScaleWidth      =   5887.19
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtFaProfile 
      Height          =   345
      Left            =   1680
      TabIndex        =   3
      Top             =   2395
      Width           =   4367
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   390
      Left            =   1560
      TabIndex        =   4
      Top             =   3240
      Width           =   1140
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   390
      Left            =   3600
      TabIndex        =   5
      Top             =   3240
      Width           =   1140
   End
   Begin VB.TextBox txtFaGroup 
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   1680
      TabIndex        =   0
      Top             =   355
      Width           =   4367
   End
   Begin VB.Frame Frame1 
      Caption         =   "Group"
      Height          =   1815
      Left            =   120
      TabIndex        =   6
      Top             =   120
      Width           =   6015
      Begin VB.TextBox txtFaPercentage 
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   1560
         TabIndex        =   2
         Top             =   1320
         Width           =   4367
      End
      Begin VB.TextBox txtFaMethod 
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   1560
         TabIndex        =   1
         Top             =   760
         Width           =   4367
      End
      Begin VB.Label Label4 
         Caption         =   "Percentage"
         Height          =   255
         Left            =   360
         TabIndex        =   11
         Top             =   1320
         Width           =   1335
      End
      Begin VB.Label Label2 
         Caption         =   "Method"
         Height          =   255
         Left            =   360
         TabIndex        =   10
         Top             =   820
         Width           =   1335
      End
      Begin VB.Label Label1 
         Caption         =   "Group"
         Height          =   255
         Left            =   360
         TabIndex        =   7
         Top             =   270
         Width           =   1335
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Profile"
      Height          =   735
      Left            =   120
      TabIndex        =   8
      Top             =   2160
      Width           =   6015
      Begin VB.Label Label3 
         Caption         =   "Profile"
         Height          =   255
         Left            =   360
         TabIndex        =   9
         Top             =   270
         Width           =   1095
      End
   End
End
Attribute VB_Name = "dlgSharesAlloc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ===============================================================================
' Private Members
' ===============================================================================
Private m_ok As Boolean
Private m_faGroup As String
Private m_faMethod As String
Private m_faPercentage As String
Private m_faProfile As String
Public Property Get faGroup() As String
    faGroup = m_faGroup
End Property
Public Property Get faMethod() As String
    faMethod = m_faMethod
End Property
Public Property Get faPercentage() As String
    faPercentage = m_faPercentage
End Property
Public Property Get faProfile() As String
    faProfile = m_faProfile
End Property
Public Property Get ok() As Boolean
    ok = m_ok
End Property

' ========================================================
' Button Events
' ========================================================
Private Sub cmdOK_Click()
    m_faGroup = txtFaGroup.text
    m_faMethod = txtFaMethod.text
    m_faPercentage = txtFaPercentage.text
    m_faProfile = txtFaProfile.text
    m_ok = True
    Me.Hide
End Sub

Private Sub cmdCancel_Click()
    m_ok = False
    Me.Hide
End Sub
' ========================================================
' Public Methods
' ========================================================
Public Sub init(acctsList As String)

End Sub

