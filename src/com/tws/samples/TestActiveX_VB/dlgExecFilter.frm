' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Begin VB.Form dlgExecFilter 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Execution Report Filter"
   ClientHeight    =   4545
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   3555
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   3555
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtReqId 
      Height          =   285
      Left            =   1800
      TabIndex        =   0
      Top             =   240
      Width           =   1455
   End
   Begin VB.TextBox txtAction 
      Height          =   285
      Left            =   1800
      TabIndex        =   7
      Top             =   3600
      Width           =   1455
   End
   Begin VB.TextBox txtClientId 
      Height          =   285
      Left            =   1800
      TabIndex        =   1
      Top             =   720
      Width           =   1455
   End
   Begin VB.TextBox txtAcctCode 
      Height          =   285
      Left            =   1800
      TabIndex        =   2
      Top             =   1200
      Width           =   1455
   End
   Begin VB.TextBox txtTime 
      Height          =   285
      Left            =   1800
      TabIndex        =   3
      Top             =   1680
      Width           =   1455
   End
   Begin VB.TextBox txtSymbol 
      Height          =   285
      Left            =   1800
      TabIndex        =   4
      Top             =   2160
      Width           =   1455
   End
   Begin VB.TextBox txtSecType 
      Height          =   285
      Left            =   1800
      TabIndex        =   5
      Top             =   2640
      Width           =   1455
   End
   Begin VB.TextBox txtExchange 
      Height          =   285
      Left            =   1800
      TabIndex        =   6
      Top             =   3120
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1965
      TabIndex        =   10
      Top             =   4080
      Width           =   1095
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   645
      TabIndex        =   8
      Top             =   4080
      Width           =   1095
   End
   Begin VB.Label lblReqId 
      Caption         =   "Request Id"
      Height          =   255
      Left            =   240
      TabIndex        =   17
      Top             =   240
      Width           =   975
   End
   Begin VB.Label lblClientId 
      Caption         =   "Client Id"
      Height          =   255
      Left            =   240
      TabIndex        =   16
      Top             =   720
      Width           =   975
   End
   Begin VB.Label lblAcctCode 
      Caption         =   "Account Code"
      Height          =   255
      Left            =   240
      TabIndex        =   15
      Top             =   1200
      Width           =   1455
   End
   Begin VB.Label lblTime 
      Caption         =   "Time"
      Height          =   255
      Left            =   240
      TabIndex        =   14
      Top             =   1680
      Width           =   975
   End
   Begin VB.Label lblSymbol 
      Caption         =   "Symbol"
      Height          =   255
      Left            =   240
      TabIndex        =   13
      Top             =   2160
      Width           =   975
   End
   Begin VB.Label lblSecType 
      Caption         =   "SecType"
      Height          =   255
      Left            =   240
      TabIndex        =   12
      Top             =   2640
      Width           =   975
   End
   Begin VB.Label lblExchange 
      Caption         =   "Exchange"
      Height          =   255
      Left            =   240
      TabIndex        =   11
      Top             =   3120
      Width           =   1095
   End
   Begin VB.Label lblAction 
      Caption         =   "Action"
      Height          =   255
      Left            =   240
      TabIndex        =   9
      Top             =   3600
      Width           =   1215
   End
End
Attribute VB_Name = "dlgExecFilter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ========================================================
' Member variables
' ========================================================
Private m_execFilter As TWSLib.IExecutionFilter

Private m_reqId As Integer

Private m_ok As Boolean

' ========================================================
' Get/Set Methods
' ========================================================
Public Property Get reqId() As Integer
    reqId = m_reqId
End Property
Public Property Get execFilter() As TWSLib.IExecutionFilter
    Set execFilter = m_execFilter
End Property
 
Public Property Get ok() As Boolean
    ok = m_ok
End Property

' ===============================================================================
' Public Methods
' ===============================================================================
Public Sub init(ByVal execFilter As TWSLib.IExecutionFilter)

    Set m_execFilter = execFilter
    
    With execFilter
    
        txtClientId.text = .clientId
        txtAcctCode.text = .acctCode
        txtTime.text = .time
        txtSymbol.text = .symbol
        txtSecType.text = .secType
        txtExchange.text = .exchange
        txtAction.text = .side
                
    End With
End Sub

' ========================================================
' Button Events
' ========================================================
Private Sub cmdOk_Click()

    m_reqId = Text2Int(txtReqId.text)
        
    With m_execFilter

        .clientId = Text2Int(txtClientId.text)
        .acctCode = txtAcctCode.text
        .time = txtTime.text
        .symbol = txtSymbol.text
        .secType = txtSecType.text
        .exchange = txtExchange.text
        .side = txtAction.text

    End With
    
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

