' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgServerResponse 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "TWS Server Response"
   ClientHeight    =   5655
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5430
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5655
   ScaleWidth      =   5430
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   2108
      TabIndex        =   0
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Label lblMsg 
      Height          =   4695
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   5055
   End
End
Attribute VB_Name = "dlgServerResponse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ===============================================================================
' Private Members
' ===============================================================================

' ===============================================================================
' Get/Set Properties
' ===============================================================================

' ========================================================
' Button Events
' ========================================================
Private Sub OKButton_Click()
    Hide
    Unload Me
End Sub
