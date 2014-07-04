' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form dlgSmartComboRoutingParams 
   Caption         =   "Smart Combo Routing Parameters"
   ClientHeight    =   5160
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4290
   LinkTopic       =   "Smart Combo Routing Parameters"
   ScaleHeight     =   5160
   ScaleWidth      =   4290
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3000
      TabIndex        =   9
      Top             =   4680
      Width           =   1215
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   1680
      TabIndex        =   8
      Top             =   4680
      Width           =   1215
   End
   Begin VB.Frame frmParameters 
      Caption         =   "Parameters"
      Height          =   4455
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4095
      Begin VB.TextBox txtValue 
         Height          =   375
         Left            =   1080
         TabIndex        =   3
         Top             =   3360
         Width           =   2895
      End
      Begin VB.TextBox txtParam 
         Height          =   375
         Left            =   1080
         TabIndex        =   2
         Top             =   2880
         Width           =   2895
      End
      Begin VB.CommandButton cmdRemoveParam 
         Caption         =   "Remove"
         Height          =   375
         Left            =   2760
         TabIndex        =   5
         Top             =   3960
         Width           =   1215
      End
      Begin VB.CommandButton cmdAddParam 
         Caption         =   "Add"
         Height          =   375
         Left            =   1440
         TabIndex        =   4
         Top             =   3960
         Width           =   1215
      End
      Begin MSFlexGridLib.MSFlexGrid grdParams 
         Height          =   2535
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   3915
         _ExtentX        =   6906
         _ExtentY        =   4471
         _Version        =   393216
         Rows            =   0
         FixedRows       =   0
         FixedCols       =   0
         ScrollBars      =   2
         SelectionMode   =   1
      End
      Begin VB.Label lblValue 
         Caption         =   "Value:"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   3360
         Width           =   735
      End
      Begin VB.Label lblParam 
         Caption         =   "Param:"
         Height          =   255
         Left            =   240
         TabIndex        =   6
         Top             =   2880
         Width           =   735
      End
   End
End
Attribute VB_Name = "dlgSmartComboRoutingParams"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private m_smartComboRoutingParams As TWSLib.ITagValueList
Private m_tws As TWSLib.tws

Private m_ok As Boolean

' ===============================================================================
' Get/Set Properties
' ===============================================================================
Public Property Get ok() As Boolean
    ok = m_ok
End Property

Public Property Get smartComboRoutingParams() As TWSLib.ITagValueList
    Set smartComboRoutingParams = m_smartComboRoutingParams
End Property

' ===============================================================================
' Public Methods
' ===============================================================================
Public Sub init(ByVal smartComboRoutingParams As TWSLib.ITagValueList, ByRef tws As TWSLib.tws)
    
    If (grdParams.Rows = 0) Then
        Call grdParams.AddItem("Param" & vbTab & "Value")
        grdParams.ColWidth(0) = grdParams.Width * 0.4
        grdParams.ColWidth(1) = grdParams.Width - grdParams.ColWidth(0) - 100
    End If
    
    Set m_tws = tws
    
    If Not smartComboRoutingParams Is Nothing Then
    
        Dim Count As Long
        Dim iLoop As Long
        Dim insertPos As Long
    
        Count = smartComboRoutingParams.Count
        For iLoop = 0 To Count - 1 Step 1

            insertPos = grdParams.Rows

            Dim param As TWSLib.ITagValue
            Set param = smartComboRoutingParams.Item(iLoop)

            Dim row As String

            With param
                row = .tag & vbTab & .value
            End With

            grdParams.AddItem row, insertPos

        Next iLoop
    End If
End Sub

' ===============================================================================
' Form Events
' ===============================================================================
Private Sub cmdOk_Click()

    Dim iLoop As Long
    Dim Count As Long
    
    Count = grdParams.Rows
    
    If (Count > 1) Then
    
        Set m_smartComboRoutingParams = m_tws.createTagValueList()

        For iLoop = 1 To Count - 1 Step 1
        
            grdParams.row = iLoop
        
            Dim tag As String
            Dim value As String
           
            grdParams.Col = 0
            tag = grdParams.text
            
            grdParams.Col = 1
            value = grdParams.text

            Dim param As TWSLib.ITagValue
            Set param = m_smartComboRoutingParams.Add(tag, value)
        
        Next iLoop

    End If
    
    Set m_tws = Nothing

    m_ok = True
    Hide

End Sub

'--------------------------------------------------------------------------------
' Cancel
'--------------------------------------------------------------------------------
Private Sub cmdCancel_Click()

    Set m_tws = Nothing

    m_ok = False
    Hide

End Sub


'--------------------------------------------------------------------------------
' Adds a param to the list
'--------------------------------------------------------------------------------
Private Sub cmdAddParam_Click()

    Dim insertPos As Long
    Dim row As String

    insertPos = grdParams.Rows
    row = txtParam.text & vbTab & txtValue.text
      
    grdParams.AddItem row, insertPos
    
End Sub

'--------------------------------------------------------------------------------
' Removes a param from the list
'--------------------------------------------------------------------------------
Private Sub cmdRemoveParam_Click()

    Dim selRowStart, selRowEnd As Long
    
    ' get the current rows selection if any
    selRowStart = grdParams.row
    selRowEnd = grdParams.RowSel

    If selRowStart > selRowEnd Then
        Dim temp As Long
        temp = selRowStart
        selRowStart = selRowEnd
        selRowEnd = temp
    End If
    
    Dim iLoop As Long
    
    For iLoop = selRowEnd To selRowStart Step -1
        If Not iLoop = 0 Then
            grdParams.RemoveItem iLoop
        End If
    Next iLoop
    
End Sub


