' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgFinancialAdvisor 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Financial Advisor"
   ClientHeight    =   8925
   ClientLeft      =   4725
   ClientTop       =   5115
   ClientWidth     =   10005
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8925
   ScaleWidth      =   10005
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox lstProfiles 
      Height          =   1815
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   4
      Text            =   "dlgFinancialAdvisor.frx":0000
      Top             =   3240
      Width           =   9495
   End
   Begin VB.TextBox lstAliases 
      Height          =   1815
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   3
      Text            =   "dlgFinancialAdvisor.frx":0008
      Top             =   5880
      Width           =   9495
   End
   Begin VB.Frame Frame1 
      Caption         =   "Groups:"
      Height          =   2415
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   9735
      Begin VB.TextBox lstGroups 
         Height          =   1815
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   2
         Text            =   "dlgFinancialAdvisor.frx":0010
         Top             =   360
         Width           =   9495
      End
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Accept Edits"
      Height          =   375
      Left            =   4395
      TabIndex        =   0
      Top             =   8400
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Caption         =   "Profiles:"
      Height          =   2415
      Left            =   120
      TabIndex        =   5
      Top             =   2880
      Width           =   9735
   End
   Begin VB.Frame Frame3 
      Caption         =   "Aliases"
      Height          =   2415
      Left            =   120
      TabIndex        =   6
      Top             =   5520
      Width           =   9735
   End
End
Attribute VB_Name = "dlgFinancialAdvisor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private m_utils As Utils
Private m_ok As Boolean
Public groupsXML, profilesXML, aliasesXML, CRSTR, CRLFSTR As String
' ========================================================
' Button Events
' ========================================================
Private Sub cmdClose_Click()
    ' clear any existing list details
    m_ok = True
    Hide
End Sub

' ========================================================
' Public methods
' ========================================================

Public Sub init(ByVal utilities As Utils, ByVal faGroupXML As String, _
                ByVal faProfilesXML As String, ByVal faAliasesXML As String)
    Set m_utils = utilities
    CRSTR = Chr$(10)
    CRLFSTR = Chr$(13) & Chr$(10)
    Rem replace carriage return with CRLF for editing in Windows
    lstGroups.text = Replace(faGroupXML, CRSTR, CRLFSTR)
    lstProfiles.text = Replace(faProfilesXML, CRSTR, CRLFSTR)
    lstAliases.text = Replace(faAliasesXML, CRSTR, CRLFSTR)
    m_ok = False
End Sub
Public Function ok()
    Rem replace CRLF with carriage return only for return to IB
    groupsXML = Replace(lstGroups.text, CRLFSTR, CRSTR)
    profilesXML = Replace(lstProfiles.text, CRLFSTR, CRSTR)
    aliasesXML = Replace(lstAliases.text, CRLFSTR, CRSTR)
    ok = m_ok
End Function
