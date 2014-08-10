' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgUnderComp 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Dialog Caption"
   ClientHeight    =   1755
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   4965
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1755
   ScaleWidth      =   4965
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtPrice 
      Height          =   375
      Left            =   1560
      TabIndex        =   2
      Top             =   1080
      Width           =   1695
   End
   Begin VB.TextBox txtDelta 
      Height          =   405
      Left            =   1560
      TabIndex        =   1
      Top             =   600
      Width           =   1695
   End
   Begin VB.TextBox txtConId 
      Height          =   375
      Left            =   1560
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   375
      Left            =   3480
      TabIndex        =   4
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3480
      TabIndex        =   6
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "OK"
      Height          =   375
      Left            =   3480
      TabIndex        =   3
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Contract Id"
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label Label3 
      Caption         =   "Price"
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   1200
      Width           =   1095
   End
   Begin VB.Label Label2 
      Caption         =   "Delta"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   720
      Width           =   1095
   End
End
Attribute VB_Name = "dlgUnderComp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ========================================================
' Member variables
' ========================================================
Private m_underComp As TWSLib.IUnderComp

Private m_ok As Boolean
Private m_reset As Boolean

' ===============================================================================
' Get/Set Properties
' ===============================================================================
Public Property Get ok() As Boolean
    ok = m_ok
End Property
Public Property Get reset() As Boolean
    reset = m_reset
End Property

' ===============================================================================
' Public Methods
' ===============================================================================
Public Sub init(ByVal underComp As TWSLib.IUnderComp)

    Set m_underComp = underComp
    
    With underComp
        txtConId.text = .conId
        txtDelta.text = .delta
        txtPrice.text = .price
    End With
    
    m_ok = False
    m_reset = False
    
End Sub

Private Sub cmdOk_Click()

    With m_underComp
        .conId = txtConId.text
        .delta = txtDelta.text
        .price = txtPrice.text
    End With
    
    Set m_underComp = Nothing
    m_ok = True
    
    Hide

End Sub

Private Sub cmdReset_Click()

    With m_underComp
        .conId = 0
        .delta = 0
        .price = 0
    End With
    
    Set m_underComp = Nothing
    m_reset = True
    
    Hide

End Sub

Private Sub cmdCancel_Click()

    m_underComp = Nothing
    Hide

End Sub

