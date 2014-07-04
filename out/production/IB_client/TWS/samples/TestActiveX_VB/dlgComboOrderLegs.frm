' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form dlgComboOrderLegs 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Combination Order Legs"
   ClientHeight    =   6150
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   10395
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6150
   ScaleWidth      =   10395
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   6600
      TabIndex        =   23
      Top             =   5640
      Width           =   1095
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   7920
      TabIndex        =   24
      Top             =   5640
      Width           =   1095
   End
   Begin VB.CommandButton cmdRemoveLeg 
      Caption         =   "Remove"
      Height          =   375
      Left            =   3120
      TabIndex        =   22
      Top             =   5040
      Width           =   975
   End
   Begin VB.Frame frmLegDetails 
      Caption         =   "Leg Details"
      Height          =   5415
      Left            =   7320
      TabIndex        =   2
      Top             =   120
      Width           =   2895
      Begin VB.TextBox txtPrice 
        Height          =   285
        Left            =   1440
        TabIndex        =   20
        Top             =   4200
        Width           =   1215
      End
      Begin VB.TextBox txtExemptCode 
         Height          =   285
         Left            =   1440
         TabIndex        =   18
         Text            =   "-1"
         Top             =   3720
         Width           =   1215
      End
      Begin VB.TextBox txtDesignatedLocation 
         Height          =   285
         Left            =   1440
         TabIndex        =   16
         Top             =   3240
         Width           =   1215
      End
      Begin VB.TextBox txtShortSaleSlot 
         Height          =   285
         Left            =   1440
         TabIndex        =   14
         Text            =   "0"
         Top             =   2760
         Width           =   1215
      End
      Begin VB.CommandButton cmdAddLeg 
         Caption         =   "Add"
         Height          =   375
         Left            =   960
         TabIndex        =   21
         Top             =   4920
         Width           =   975
      End
      Begin VB.TextBox txtOpenClose 
         Height          =   285
         Left            =   1440
         TabIndex        =   12
         Text            =   "0"
         Top             =   2280
         Width           =   1215
      End
      Begin VB.TextBox txtExchange 
         Height          =   285
         Left            =   1440
         TabIndex        =   10
         Text            =   "SMART"
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox txtAction 
         Height          =   285
         Left            =   1440
         TabIndex        =   8
         Text            =   "BUY"
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox txtRatio 
         Height          =   285
         Left            =   1440
         TabIndex        =   6
         Text            =   "1"
         Top             =   840
         Width           =   1215
      End
      Begin VB.TextBox txtConid 
         Height          =   285
         Left            =   1440
         TabIndex        =   4
         Text            =   "0"
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label9
         Caption         =   "Price"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   4200
         Width           =   1095
      End
      Begin VB.Label Label8
         Caption         =   "Exempt Code"
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   3720
         Width           =   1095
      End
      Begin VB.Label Label7 
         Caption         =   "Location"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   3240
         Width           =   855
      End
      Begin VB.Label Label6 
         Caption         =   "Short Sale Slot"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   2760
         Width           =   1215
      End
      Begin VB.Label Label5 
         Caption         =   "Open/Close"
         Height          =   255
         Left            =   240
         TabIndex        =   11
         Top             =   2280
         Width           =   975
      End
      Begin VB.Label Label4 
         Caption         =   "Exchange"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   1800
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Side"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   1320
         Width           =   975
      End
      Begin VB.Label Label2 
         Caption         =   "Ratio"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   840
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "Conid"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Combo Legs"
      Height          =   5415
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6975
      Begin MSFlexGridLib.MSFlexGrid grdComboLegs 
         Height          =   3735
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   6735
         _ExtentX        =   11880
         _ExtentY        =   6588
         _Version        =   393216
         Rows            =   0
         Cols            =   9
         FixedRows       =   0
         FixedCols       =   0
         SelectionMode   =   1
      End
   End
End
Attribute VB_Name = "dlgComboOrderLegs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private m_comboLegs As TWSLib.IComboLegList
Private m_orderComboLegs As TWSLib.IOrderComboLegList
Private m_tws As tws
Private m_mainWnd As dlgMainWnd

Private m_ok As Boolean

' ===============================================================================
' Get/Set Properties
' ===============================================================================
Public Property Get ok() As Boolean
    ok = m_ok
End Property

Public Property Get comboLegs() As TWSLib.IComboLegList
    Set comboLegs = m_comboLegs
End Property

Public Property Get orderComboLegs() As TWSLib.IOrderComboLegList
    Set orderComboLegs = m_orderComboLegs
End Property

' ===============================================================================
' Public Methods
' ===============================================================================
Public Sub init(ByVal comboLegs As TWSLib.IComboLegList, ByVal orderComboLegs As TWSLib.IOrderComboLegList, ByVal tws As tws)
    
    Set m_tws = tws
    Set m_mainWnd = dlgMainWnd
    
    If (Not comboLegs Is Nothing) And (Not orderComboLegs Is Nothing) Then
    
        Dim Count As Long
        Dim iLoop As Long
        Dim insertPos As Long
    
        Count = comboLegs.Count
        For iLoop = 0 To Count - 1 Step 1

            insertPos = grdComboLegs.Rows

            Dim cmbLeg As TWSLib.IComboLeg
            Set cmbLeg = comboLegs.Item(iLoop)
            Dim orderCmbLeg As TWSLib.IOrderComboLeg
            Set orderCmbLeg = orderComboLegs.Item(iLoop)

            Dim row As String

            With cmbLeg
                row = .conId & vbTab & .ratio & vbTab & .Action & vbTab _
                & .exchange & vbTab & .openClose & vbTab _
                & .shortSaleSlot & vbTab & .designatedLocation & vbTab _
                & .exemptCode
            End With

            With orderCmbLeg
                If .price = m_mainWnd.m_maxDouble Then
                    row = row & vbTab
                Else
                    row = row & vbTab & .price
                End If
            End With

            grdComboLegs.AddItem row, insertPos

        Next iLoop
    End If
End Sub

' ===============================================================================
' Form Events
' ===============================================================================
Private Sub cmdOk_Click()

    Dim iLoop As Long
    Dim Count As Long
    
    Count = grdComboLegs.Rows
    
    If (Count > 1) Then
    
        Set m_comboLegs = m_tws.createComboLegList()
        Set m_orderComboLegs = m_tws.createOrderComboLegList()

        For iLoop = 1 To Count - 1 Step 1

            Dim cmbLeg As TWSLib.IComboLeg
            Set cmbLeg = m_comboLegs.Add()
            Dim orderCmbLeg As TWSLib.IOrderComboLeg
            Set orderCmbLeg = m_orderComboLegs.Add()
       
            grdComboLegs.row = iLoop

            grdComboLegs.Col = 0
            cmbLeg.conId = grdComboLegs.text
        
            grdComboLegs.Col = 1
            cmbLeg.ratio = grdComboLegs.text
        
            grdComboLegs.Col = 2
            cmbLeg.Action = grdComboLegs.text
        
            grdComboLegs.Col = 3
            cmbLeg.exchange = grdComboLegs.text
        
            grdComboLegs.Col = 4
            cmbLeg.openClose = grdComboLegs.text
        
            grdComboLegs.Col = 5
            cmbLeg.shortSaleSlot = grdComboLegs.text
        
            grdComboLegs.Col = 6
            cmbLeg.designatedLocation = grdComboLegs.text

            grdComboLegs.Col = 7
            If grdComboLegs.text <> "" Then
                cmbLeg.exemptCode = CInt(grdComboLegs.text)
            Else
                cmbLeg.exemptCode = CInt("-1")
            End If

            grdComboLegs.Col = 8
            If Len(grdComboLegs.text) = 0 Then
                orderCmbLeg.price = m_mainWnd.m_maxDouble
            Else
                orderCmbLeg.price = CDbl(grdComboLegs.text)
            End If

        Next iLoop

    End If

    m_ok = True
    Hide

End Sub

'--------------------------------------------------------------------------------
' Cancel
'--------------------------------------------------------------------------------
Private Sub cmdCancel_Click()

    m_ok = False
    Hide
End Sub

'--------------------------------------------------------------------------------
' Adds a combo leg to the list
'--------------------------------------------------------------------------------
Private Sub cmdAddLeg_Click()
    Dim insertPos As Long
    Dim row As String
    insertPos = grdComboLegs.Rows
    row = txtConid.text & vbTab & txtRatio.text & vbTab & txtAction.text & vbTab _
            & txtExchange.text & vbTab & txtOpenClose.text & vbTab _
            & txtShortSaleSlot.text & vbTab & txtDesignatedLocation.text & vbTab _
            & txtExemptCode.text & vbTab & txtPrice.text
            
    grdComboLegs.AddItem row, insertPos
End Sub

'--------------------------------------------------------------------------------
' Removes a combo leg from the list
'--------------------------------------------------------------------------------
Private Sub cmdRemoveLeg_Click()
    Dim selRowStart, selRowEnd, temp, iLoop As Long
    
    ' get the current rows selection if any
    selRowStart = grdComboLegs.row
    selRowEnd = grdComboLegs.RowSel
    If selRowStart > selRowEnd Then
        temp = selRowStart
        selRowStart = selRowEnd
        selRowEnd = temp
    End If
    
    For iLoop = selRowEnd To selRowStart Step -1
        If Not iLoop = 0 Then
            grdComboLegs.RemoveItem iLoop
        End If
    Next iLoop
    
End Sub

'--------------------------------------------------------------------------------
' Call when the form is first loaded and the combo leg header row is added
'--------------------------------------------------------------------------------
Private Sub Form_Load()
    Dim title As String
    title = "Combination Order Legs"
    Call grdComboLegs.AddItem("ConId" & vbTab & "Ratio" & vbTab & "Side" & vbTab & "Exchange" _
            & vbTab & "Open/Close" & vbTab & "Short Sale Slot" & vbTab & "Location" & vbTab & "Exempt Code" & vbTab & "Price", 0)
End Sub
