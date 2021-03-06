' Copyright (C) 2013 Interactive Brokers LLC. All rights reserved. This code is subject to the terms
' and conditions of the IB API Non-Commercial License or the IB API Commercial License, as applicable.

Option Strict Off
Option Explicit On 
Imports System.Xml

Friend Class dlgMainWnd
	Inherits System.Windows.Forms.Form
#Region "Windows Form Designer generated code "
	Public Sub New()
		MyBase.New()
		If m_vb6FormDefInstance Is Nothing Then
			If m_InitializingDefInstance Then
				m_vb6FormDefInstance = Me
			Else
				Try 
					'For the start-up form, the first instance created is the default instance.
					If System.Reflection.Assembly.GetExecutingAssembly.EntryPoint.DeclaringType Is Me.GetType Then
						m_vb6FormDefInstance = Me
					End If
				Catch
				End Try
			End If
		End If
		'This call is required by the Windows Form Designer.
		InitializeComponent()
	End Sub
	'Form overrides dispose to clean up the component list.
	Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer
    Public vbTwips As Integer
    Public WithEvents Tws1 As AxTWSLib.AxTws
	Public WithEvents cmdReqHistoricalData As System.Windows.Forms.Button
	Public WithEvents cmdFinancialAdvisor As System.Windows.Forms.Button
    Public WithEvents cmdReqAllOpenOrders As System.Windows.Forms.Button
	Public WithEvents cmdReqAutoOpenOrders As System.Windows.Forms.Button
	Public WithEvents cmdServerLogLevel As System.Windows.Forms.Button
	Public WithEvents cmdReqNews As System.Windows.Forms.Button
	Public WithEvents cmdReqAcctData As System.Windows.Forms.Button
	Public WithEvents cmdReqExecutions As System.Windows.Forms.Button
	Public WithEvents cmdReqIds As System.Windows.Forms.Button
	Public WithEvents cmdClearForm As System.Windows.Forms.Button
	Public WithEvents cmdClose As System.Windows.Forms.Button
	Public WithEvents cmdDisconnect As System.Windows.Forms.Button
	Public WithEvents cmdReqMktData As System.Windows.Forms.Button
    Public WithEvents cmdReqMktDepth As System.Windows.Forms.Button
    Public WithEvents cmdCancelMktDepth As System.Windows.Forms.Button
    Public WithEvents cmdPlaceOrder As System.Windows.Forms.Button
    Public WithEvents cmdCancelOrder As System.Windows.Forms.Button
    Public WithEvents cmdExtendedOrderAtribs As System.Windows.Forms.Button
    Public WithEvents cmdReqContractData As System.Windows.Forms.Button
    Public WithEvents cmdReqOpenOrders As System.Windows.Forms.Button
    Public WithEvents cmdConnect As System.Windows.Forms.Button
    Public WithEvents lstErrors As System.Windows.Forms.ListBox
    Public WithEvents lstServerResponses As System.Windows.Forms.ListBox
    Public WithEvents lstMktData As System.Windows.Forms.ListBox
    Public WithEvents Label3 As System.Windows.Forms.Label
    Public WithEvents Label2 As System.Windows.Forms.Label
    Public WithEvents Label1 As System.Windows.Forms.Label
    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    Public WithEvents cmdReqAccts As System.Windows.Forms.Button
    Public WithEvents cmdExerciseOptions As System.Windows.Forms.Button
    Public WithEvents cmdCancelHistData As System.Windows.Forms.Button
    Public WithEvents cmdReqRealTimeBars As System.Windows.Forms.Button
    Public WithEvents cmdCancelRealTimeBars As System.Windows.Forms.Button
    Public WithEvents cmdReqCurrentTime As System.Windows.Forms.Button
    Public WithEvents cmdWhatIf As System.Windows.Forms.Button
    Friend WithEvents cmdCalcImpliedVolatility As System.Windows.Forms.Button
    Friend WithEvents cmdCalcOptionPrice As System.Windows.Forms.Button
    Friend WithEvents cmdCancelCalcImpliedVolatility As System.Windows.Forms.Button
    Friend WithEvents cmdCancelCalcOptionPrice As System.Windows.Forms.Button
    Friend WithEvents cmdReqGlobalCancel As System.Windows.Forms.Button
    Friend WithEvents cmdReqMarketDataType As System.Windows.Forms.Button
    Public WithEvents cmdCancelMktData As System.Windows.Forms.Button
    Friend WithEvents cmdReqPositions As System.Windows.Forms.Button
    Friend WithEvents cmdReqAccountSummary As System.Windows.Forms.Button
    Friend WithEvents cmdCancelAccountSummary As System.Windows.Forms.Button
    Friend WithEvents cmdCancelPositions As System.Windows.Forms.Button
    Public WithEvents cmdScanner As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(dlgMainWnd))
        Me.Tws1 = New AxTWSLib.AxTws
        Me.cmdReqHistoricalData = New System.Windows.Forms.Button
        Me.cmdFinancialAdvisor = New System.Windows.Forms.Button
        Me.cmdReqAccts = New System.Windows.Forms.Button
        Me.cmdReqAllOpenOrders = New System.Windows.Forms.Button
        Me.cmdReqAutoOpenOrders = New System.Windows.Forms.Button
        Me.cmdServerLogLevel = New System.Windows.Forms.Button
        Me.cmdReqNews = New System.Windows.Forms.Button
        Me.cmdReqAcctData = New System.Windows.Forms.Button
        Me.cmdReqExecutions = New System.Windows.Forms.Button
        Me.cmdReqIds = New System.Windows.Forms.Button
        Me.cmdClearForm = New System.Windows.Forms.Button
        Me.cmdClose = New System.Windows.Forms.Button
        Me.cmdDisconnect = New System.Windows.Forms.Button
        Me.cmdReqMktData = New System.Windows.Forms.Button
        Me.cmdReqMktDepth = New System.Windows.Forms.Button
        Me.cmdCancelMktDepth = New System.Windows.Forms.Button
        Me.cmdPlaceOrder = New System.Windows.Forms.Button
        Me.cmdCancelOrder = New System.Windows.Forms.Button
        Me.cmdExtendedOrderAtribs = New System.Windows.Forms.Button
        Me.cmdReqContractData = New System.Windows.Forms.Button
        Me.cmdReqOpenOrders = New System.Windows.Forms.Button
        Me.cmdConnect = New System.Windows.Forms.Button
        Me.lstErrors = New System.Windows.Forms.ListBox
        Me.lstServerResponses = New System.Windows.Forms.ListBox
        Me.lstMktData = New System.Windows.Forms.ListBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.cmdExerciseOptions = New System.Windows.Forms.Button
        Me.cmdCancelHistData = New System.Windows.Forms.Button
        Me.cmdScanner = New System.Windows.Forms.Button
        Me.cmdReqRealTimeBars = New System.Windows.Forms.Button
        Me.cmdCancelRealTimeBars = New System.Windows.Forms.Button
        Me.cmdReqCurrentTime = New System.Windows.Forms.Button
        Me.cmdWhatIf = New System.Windows.Forms.Button
        Me.cmdCalcImpliedVolatility = New System.Windows.Forms.Button
        Me.cmdCalcOptionPrice = New System.Windows.Forms.Button
        Me.cmdCancelCalcImpliedVolatility = New System.Windows.Forms.Button
        Me.cmdCancelCalcOptionPrice = New System.Windows.Forms.Button
        Me.cmdReqGlobalCancel = New System.Windows.Forms.Button
        Me.cmdReqMarketDataType = New System.Windows.Forms.Button
        Me.cmdCancelMktData = New System.Windows.Forms.Button
        Me.cmdReqPositions = New System.Windows.Forms.Button
        Me.cmdReqAccountSummary = New System.Windows.Forms.Button
        Me.cmdCancelAccountSummary = New System.Windows.Forms.Button
        Me.cmdCancelPositions = New System.Windows.Forms.Button
        CType(Me.Tws1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Tws1
        '
        Me.Tws1.Enabled = True
        Me.Tws1.Location = New System.Drawing.Point(19, 763)
        Me.Tws1.Name = "Tws1"
        Me.Tws1.OcxState = CType(resources.GetObject("Tws1.OcxState"), System.Windows.Forms.AxHost.State)
        Me.Tws1.Size = New System.Drawing.Size(145, 25)
        Me.Tws1.TabIndex = 46
        '
        'cmdReqHistoricalData
        '
        Me.cmdReqHistoricalData.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqHistoricalData.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqHistoricalData.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqHistoricalData.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqHistoricalData.Location = New System.Drawing.Point(544, 93)
        Me.cmdReqHistoricalData.Name = "cmdReqHistoricalData"
        Me.cmdReqHistoricalData.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqHistoricalData.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqHistoricalData.TabIndex = 6
        Me.cmdReqHistoricalData.Text = "Historical Data..."
        Me.cmdReqHistoricalData.UseVisualStyleBackColor = False
        '
        'cmdFinancialAdvisor
        '
        Me.cmdFinancialAdvisor.BackColor = System.Drawing.SystemColors.Control
        Me.cmdFinancialAdvisor.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdFinancialAdvisor.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdFinancialAdvisor.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdFinancialAdvisor.Location = New System.Drawing.Point(544, 644)
        Me.cmdFinancialAdvisor.Name = "cmdFinancialAdvisor"
        Me.cmdFinancialAdvisor.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdFinancialAdvisor.Size = New System.Drawing.Size(134, 21)
        Me.cmdFinancialAdvisor.TabIndex = 31
        Me.cmdFinancialAdvisor.Text = "Financial Advisor"
        Me.cmdFinancialAdvisor.UseVisualStyleBackColor = False
        '
        'cmdReqAccts
        '
        Me.cmdReqAccts.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqAccts.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqAccts.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqAccts.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqAccts.Location = New System.Drawing.Point(544, 623)
        Me.cmdReqAccts.Name = "cmdReqAccts"
        Me.cmdReqAccts.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqAccts.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqAccts.TabIndex = 30
        Me.cmdReqAccts.Text = "Req Accounts"
        Me.cmdReqAccts.UseVisualStyleBackColor = False
        '
        'cmdReqAllOpenOrders
        '
        Me.cmdReqAllOpenOrders.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqAllOpenOrders.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqAllOpenOrders.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqAllOpenOrders.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqAllOpenOrders.Location = New System.Drawing.Point(544, 468)
        Me.cmdReqAllOpenOrders.Name = "cmdReqAllOpenOrders"
        Me.cmdReqAllOpenOrders.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqAllOpenOrders.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqAllOpenOrders.TabIndex = 23
        Me.cmdReqAllOpenOrders.Text = "Req All Open Orders"
        Me.cmdReqAllOpenOrders.UseVisualStyleBackColor = False
        '
        'cmdReqAutoOpenOrders
        '
        Me.cmdReqAutoOpenOrders.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqAutoOpenOrders.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqAutoOpenOrders.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqAutoOpenOrders.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqAutoOpenOrders.Location = New System.Drawing.Point(544, 490)
        Me.cmdReqAutoOpenOrders.Name = "cmdReqAutoOpenOrders"
        Me.cmdReqAutoOpenOrders.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqAutoOpenOrders.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqAutoOpenOrders.TabIndex = 24
        Me.cmdReqAutoOpenOrders.Text = "Req Auto Open Orders"
        Me.cmdReqAutoOpenOrders.UseVisualStyleBackColor = False
        '
        'cmdServerLogLevel
        '
        Me.cmdServerLogLevel.BackColor = System.Drawing.SystemColors.Control
        Me.cmdServerLogLevel.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdServerLogLevel.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdServerLogLevel.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdServerLogLevel.Location = New System.Drawing.Point(544, 601)
        Me.cmdServerLogLevel.Name = "cmdServerLogLevel"
        Me.cmdServerLogLevel.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdServerLogLevel.Size = New System.Drawing.Size(134, 21)
        Me.cmdServerLogLevel.TabIndex = 29
        Me.cmdServerLogLevel.Text = "Log Configuration..."
        Me.cmdServerLogLevel.UseVisualStyleBackColor = False
        '
        'cmdReqNews
        '
        Me.cmdReqNews.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqNews.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqNews.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqNews.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqNews.Location = New System.Drawing.Point(544, 579)
        Me.cmdReqNews.Name = "cmdReqNews"
        Me.cmdReqNews.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqNews.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqNews.TabIndex = 28
        Me.cmdReqNews.Text = "Req News Bulletins..."
        Me.cmdReqNews.UseVisualStyleBackColor = False
        '
        'cmdReqAcctData
        '
        Me.cmdReqAcctData.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqAcctData.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqAcctData.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqAcctData.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqAcctData.Location = New System.Drawing.Point(544, 512)
        Me.cmdReqAcctData.Name = "cmdReqAcctData"
        Me.cmdReqAcctData.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqAcctData.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqAcctData.TabIndex = 25
        Me.cmdReqAcctData.Text = "Req Acct Data..."
        Me.cmdReqAcctData.UseVisualStyleBackColor = False
        '
        'cmdReqExecutions
        '
        Me.cmdReqExecutions.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqExecutions.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqExecutions.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqExecutions.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqExecutions.Location = New System.Drawing.Point(544, 534)
        Me.cmdReqExecutions.Name = "cmdReqExecutions"
        Me.cmdReqExecutions.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqExecutions.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqExecutions.TabIndex = 26
        Me.cmdReqExecutions.Text = "Req Executions..."
        Me.cmdReqExecutions.UseVisualStyleBackColor = False
        '
        'cmdReqIds
        '
        Me.cmdReqIds.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqIds.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqIds.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqIds.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqIds.Location = New System.Drawing.Point(544, 556)
        Me.cmdReqIds.Name = "cmdReqIds"
        Me.cmdReqIds.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqIds.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqIds.TabIndex = 27
        Me.cmdReqIds.Text = "Req Next Id..."
        Me.cmdReqIds.UseVisualStyleBackColor = False
        '
        'cmdClearForm
        '
        Me.cmdClearForm.BackColor = System.Drawing.SystemColors.Control
        Me.cmdClearForm.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdClearForm.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdClearForm.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdClearForm.Location = New System.Drawing.Point(216, 763)
        Me.cmdClearForm.Name = "cmdClearForm"
        Me.cmdClearForm.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdClearForm.Size = New System.Drawing.Size(89, 25)
        Me.cmdClearForm.TabIndex = 38
        Me.cmdClearForm.Text = "Clear"
        Me.cmdClearForm.UseVisualStyleBackColor = False
        '
        'cmdClose
        '
        Me.cmdClose.BackColor = System.Drawing.SystemColors.Control
        Me.cmdClose.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdClose.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdClose.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdClose.Location = New System.Drawing.Point(320, 763)
        Me.cmdClose.Name = "cmdClose"
        Me.cmdClose.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdClose.Size = New System.Drawing.Size(89, 25)
        Me.cmdClose.TabIndex = 39
        Me.cmdClose.Text = "Close"
        Me.cmdClose.UseVisualStyleBackColor = False
        '
        'cmdDisconnect
        '
        Me.cmdDisconnect.BackColor = System.Drawing.SystemColors.Control
        Me.cmdDisconnect.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdDisconnect.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdDisconnect.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdDisconnect.Location = New System.Drawing.Point(320, 4)
        Me.cmdDisconnect.Name = "cmdDisconnect"
        Me.cmdDisconnect.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdDisconnect.Size = New System.Drawing.Size(113, 25)
        Me.cmdDisconnect.TabIndex = 1
        Me.cmdDisconnect.Text = "Disconnect"
        Me.cmdDisconnect.UseVisualStyleBackColor = False
        '
        'cmdReqMktData
        '
        Me.cmdReqMktData.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqMktData.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqMktData.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqMktData.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqMktData.Location = New System.Drawing.Point(544, 6)
        Me.cmdReqMktData.Name = "cmdReqMktData"
        Me.cmdReqMktData.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqMktData.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqMktData.TabIndex = 2
        Me.cmdReqMktData.Text = "Req Mkt Data..."
        Me.cmdReqMktData.UseVisualStyleBackColor = False
        '
        'cmdReqMktDepth
        '
        Me.cmdReqMktDepth.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqMktDepth.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqMktDepth.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqMktDepth.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqMktDepth.Location = New System.Drawing.Point(544, 50)
        Me.cmdReqMktDepth.Name = "cmdReqMktDepth"
        Me.cmdReqMktDepth.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqMktDepth.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqMktDepth.TabIndex = 4
        Me.cmdReqMktDepth.Text = "Req Mkt Depth..."
        Me.cmdReqMktDepth.UseVisualStyleBackColor = False
        '
        'cmdCancelMktDepth
        '
        Me.cmdCancelMktDepth.BackColor = System.Drawing.SystemColors.Control
        Me.cmdCancelMktDepth.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdCancelMktDepth.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdCancelMktDepth.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdCancelMktDepth.Location = New System.Drawing.Point(544, 72)
        Me.cmdCancelMktDepth.Name = "cmdCancelMktDepth"
        Me.cmdCancelMktDepth.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdCancelMktDepth.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelMktDepth.TabIndex = 5
        Me.cmdCancelMktDepth.Text = "Cancel Mkt Depth..."
        Me.cmdCancelMktDepth.UseVisualStyleBackColor = False
        '
        'cmdPlaceOrder
        '
        Me.cmdPlaceOrder.BackColor = System.Drawing.SystemColors.Control
        Me.cmdPlaceOrder.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdPlaceOrder.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdPlaceOrder.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdPlaceOrder.Location = New System.Drawing.Point(544, 336)
        Me.cmdPlaceOrder.Name = "cmdPlaceOrder"
        Me.cmdPlaceOrder.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdPlaceOrder.Size = New System.Drawing.Size(134, 21)
        Me.cmdPlaceOrder.TabIndex = 17
        Me.cmdPlaceOrder.Text = "Place Order..."
        Me.cmdPlaceOrder.UseVisualStyleBackColor = False
        '
        'cmdCancelOrder
        '
        Me.cmdCancelOrder.BackColor = System.Drawing.SystemColors.Control
        Me.cmdCancelOrder.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdCancelOrder.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdCancelOrder.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdCancelOrder.Location = New System.Drawing.Point(544, 358)
        Me.cmdCancelOrder.Name = "cmdCancelOrder"
        Me.cmdCancelOrder.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdCancelOrder.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelOrder.TabIndex = 18
        Me.cmdCancelOrder.Text = "Cancel Order..."
        Me.cmdCancelOrder.UseVisualStyleBackColor = False
        '
        'cmdExtendedOrderAtribs
        '
        Me.cmdExtendedOrderAtribs.BackColor = System.Drawing.SystemColors.Control
        Me.cmdExtendedOrderAtribs.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdExtendedOrderAtribs.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdExtendedOrderAtribs.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdExtendedOrderAtribs.Location = New System.Drawing.Point(544, 402)
        Me.cmdExtendedOrderAtribs.Name = "cmdExtendedOrderAtribs"
        Me.cmdExtendedOrderAtribs.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdExtendedOrderAtribs.Size = New System.Drawing.Size(134, 21)
        Me.cmdExtendedOrderAtribs.TabIndex = 20
        Me.cmdExtendedOrderAtribs.Text = "Extended..."
        Me.cmdExtendedOrderAtribs.UseVisualStyleBackColor = False
        '
        'cmdReqContractData
        '
        Me.cmdReqContractData.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqContractData.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqContractData.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqContractData.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqContractData.Location = New System.Drawing.Point(544, 424)
        Me.cmdReqContractData.Name = "cmdReqContractData"
        Me.cmdReqContractData.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqContractData.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqContractData.TabIndex = 21
        Me.cmdReqContractData.Text = "Req Contract Data..."
        Me.cmdReqContractData.UseVisualStyleBackColor = False
        '
        'cmdReqOpenOrders
        '
        Me.cmdReqOpenOrders.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqOpenOrders.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqOpenOrders.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqOpenOrders.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqOpenOrders.Location = New System.Drawing.Point(544, 446)
        Me.cmdReqOpenOrders.Name = "cmdReqOpenOrders"
        Me.cmdReqOpenOrders.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqOpenOrders.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqOpenOrders.TabIndex = 22
        Me.cmdReqOpenOrders.Text = "Req Open Orders"
        Me.cmdReqOpenOrders.UseVisualStyleBackColor = False
        '
        'cmdConnect
        '
        Me.cmdConnect.BackColor = System.Drawing.SystemColors.Control
        Me.cmdConnect.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdConnect.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdConnect.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdConnect.Location = New System.Drawing.Point(200, 4)
        Me.cmdConnect.Name = "cmdConnect"
        Me.cmdConnect.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdConnect.Size = New System.Drawing.Size(113, 25)
        Me.cmdConnect.TabIndex = 0
        Me.cmdConnect.Text = "Connect..."
        Me.cmdConnect.UseVisualStyleBackColor = False
        '
        'lstErrors
        '
        Me.lstErrors.BackColor = System.Drawing.SystemColors.Window
        Me.lstErrors.Cursor = System.Windows.Forms.Cursors.Default
        Me.lstErrors.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lstErrors.ForeColor = System.Drawing.SystemColors.WindowText
        Me.lstErrors.HorizontalScrollbar = True
        Me.lstErrors.ItemHeight = 14
        Me.lstErrors.Location = New System.Drawing.Point(8, 515)
        Me.lstErrors.Name = "lstErrors"
        Me.lstErrors.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.lstErrors.Size = New System.Drawing.Size(529, 242)
        Me.lstErrors.TabIndex = 45
        '
        'lstServerResponses
        '
        Me.lstServerResponses.BackColor = System.Drawing.SystemColors.Window
        Me.lstServerResponses.Cursor = System.Windows.Forms.Cursors.Default
        Me.lstServerResponses.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lstServerResponses.ForeColor = System.Drawing.SystemColors.WindowText
        Me.lstServerResponses.HorizontalScrollbar = True
        Me.lstServerResponses.ItemHeight = 14
        Me.lstServerResponses.Location = New System.Drawing.Point(8, 256)
        Me.lstServerResponses.Name = "lstServerResponses"
        Me.lstServerResponses.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.lstServerResponses.Size = New System.Drawing.Size(529, 228)
        Me.lstServerResponses.TabIndex = 43
        '
        'lstMktData
        '
        Me.lstMktData.BackColor = System.Drawing.SystemColors.Window
        Me.lstMktData.Cursor = System.Windows.Forms.Cursors.Default
        Me.lstMktData.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lstMktData.ForeColor = System.Drawing.SystemColors.WindowText
        Me.lstMktData.HorizontalScrollbar = True
        Me.lstMktData.ItemHeight = 14
        Me.lstMktData.Location = New System.Drawing.Point(8, 36)
        Me.lstMktData.Name = "lstMktData"
        Me.lstMktData.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.lstMktData.Size = New System.Drawing.Size(529, 200)
        Me.lstMktData.TabIndex = 41
        '
        'Label3
        '
        Me.Label3.BackColor = System.Drawing.SystemColors.Control
        Me.Label3.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label3.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label3.Location = New System.Drawing.Point(8, 495)
        Me.Label3.Name = "Label3"
        Me.Label3.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label3.Size = New System.Drawing.Size(120, 17)
        Me.Label3.TabIndex = 44
        Me.Label3.Text = "Errors and Messages"
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.SystemColors.Control
        Me.Label2.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label2.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label2.Location = New System.Drawing.Point(8, 240)
        Me.Label2.Name = "Label2"
        Me.Label2.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label2.Size = New System.Drawing.Size(136, 17)
        Me.Label2.TabIndex = 42
        Me.Label2.Text = "TWS Server Responses"
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.Control
        Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
        Me.Label1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label1.Location = New System.Drawing.Point(8, 20)
        Me.Label1.Name = "Label1"
        Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Label1.Size = New System.Drawing.Size(144, 17)
        Me.Label1.TabIndex = 40
        Me.Label1.Text = "Market and Historical Data"
        '
        'cmdExerciseOptions
        '
        Me.cmdExerciseOptions.BackColor = System.Drawing.SystemColors.Control
        Me.cmdExerciseOptions.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdExerciseOptions.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdExerciseOptions.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdExerciseOptions.Location = New System.Drawing.Point(544, 380)
        Me.cmdExerciseOptions.Name = "cmdExerciseOptions"
        Me.cmdExerciseOptions.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdExerciseOptions.Size = New System.Drawing.Size(134, 21)
        Me.cmdExerciseOptions.TabIndex = 19
        Me.cmdExerciseOptions.Text = "Exercise Options..."
        Me.cmdExerciseOptions.UseVisualStyleBackColor = False
        '
        'cmdCancelHistData
        '
        Me.cmdCancelHistData.BackColor = System.Drawing.SystemColors.Control
        Me.cmdCancelHistData.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdCancelHistData.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdCancelHistData.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdCancelHistData.Location = New System.Drawing.Point(544, 116)
        Me.cmdCancelHistData.Name = "cmdCancelHistData"
        Me.cmdCancelHistData.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdCancelHistData.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelHistData.TabIndex = 7
        Me.cmdCancelHistData.Text = "Cancel Hist. Data..."
        Me.cmdCancelHistData.UseVisualStyleBackColor = False
        '
        'cmdScanner
        '
        Me.cmdScanner.BackColor = System.Drawing.SystemColors.Control
        Me.cmdScanner.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdScanner.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdScanner.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdScanner.Location = New System.Drawing.Point(543, 204)
        Me.cmdScanner.Name = "cmdScanner"
        Me.cmdScanner.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdScanner.Size = New System.Drawing.Size(134, 21)
        Me.cmdScanner.TabIndex = 11
        Me.cmdScanner.Text = "Market Scanner..."
        Me.cmdScanner.UseVisualStyleBackColor = False
        '
        'cmdReqRealTimeBars
        '
        Me.cmdReqRealTimeBars.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqRealTimeBars.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqRealTimeBars.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqRealTimeBars.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqRealTimeBars.Location = New System.Drawing.Point(543, 137)
        Me.cmdReqRealTimeBars.Name = "cmdReqRealTimeBars"
        Me.cmdReqRealTimeBars.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqRealTimeBars.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqRealTimeBars.TabIndex = 8
        Me.cmdReqRealTimeBars.Text = "Real Time Bars"
        Me.cmdReqRealTimeBars.UseVisualStyleBackColor = False
        '
        'cmdCancelRealTimeBars
        '
        Me.cmdCancelRealTimeBars.BackColor = System.Drawing.SystemColors.Control
        Me.cmdCancelRealTimeBars.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdCancelRealTimeBars.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdCancelRealTimeBars.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdCancelRealTimeBars.Location = New System.Drawing.Point(543, 159)
        Me.cmdCancelRealTimeBars.Name = "cmdCancelRealTimeBars"
        Me.cmdCancelRealTimeBars.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdCancelRealTimeBars.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelRealTimeBars.TabIndex = 9
        Me.cmdCancelRealTimeBars.Text = "Canc Real Time Bars"
        Me.cmdCancelRealTimeBars.UseVisualStyleBackColor = False
        '
        'cmdReqCurrentTime
        '
        Me.cmdReqCurrentTime.BackColor = System.Drawing.SystemColors.Control
        Me.cmdReqCurrentTime.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdReqCurrentTime.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdReqCurrentTime.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdReqCurrentTime.Location = New System.Drawing.Point(543, 182)
        Me.cmdReqCurrentTime.Name = "cmdReqCurrentTime"
        Me.cmdReqCurrentTime.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdReqCurrentTime.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqCurrentTime.TabIndex = 10
        Me.cmdReqCurrentTime.Text = "Current Time"
        Me.cmdReqCurrentTime.UseVisualStyleBackColor = False
        '
        'cmdWhatIf
        '
        Me.cmdWhatIf.BackColor = System.Drawing.SystemColors.Control
        Me.cmdWhatIf.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdWhatIf.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdWhatIf.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdWhatIf.Location = New System.Drawing.Point(544, 314)
        Me.cmdWhatIf.Name = "cmdWhatIf"
        Me.cmdWhatIf.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdWhatIf.Size = New System.Drawing.Size(134, 21)
        Me.cmdWhatIf.TabIndex = 16
        Me.cmdWhatIf.Text = "What If..."
        Me.cmdWhatIf.UseVisualStyleBackColor = False
        '
        'cmdCalcImpliedVolatility
        '
        Me.cmdCalcImpliedVolatility.Location = New System.Drawing.Point(543, 226)
        Me.cmdCalcImpliedVolatility.Name = "cmdCalcImpliedVolatility"
        Me.cmdCalcImpliedVolatility.Size = New System.Drawing.Size(134, 21)
        Me.cmdCalcImpliedVolatility.TabIndex = 12
        Me.cmdCalcImpliedVolatility.Text = "Calc Implied Volatility"
        Me.cmdCalcImpliedVolatility.UseVisualStyleBackColor = True
        '
        'cmdCalcOptionPrice
        '
        Me.cmdCalcOptionPrice.Location = New System.Drawing.Point(543, 270)
        Me.cmdCalcOptionPrice.Name = "cmdCalcOptionPrice"
        Me.cmdCalcOptionPrice.Size = New System.Drawing.Size(134, 21)
        Me.cmdCalcOptionPrice.TabIndex = 14
        Me.cmdCalcOptionPrice.Text = "Calc Option Price"
        Me.cmdCalcOptionPrice.UseVisualStyleBackColor = True
        '
        'cmdCancelCalcImpliedVolatility
        '
        Me.cmdCancelCalcImpliedVolatility.Location = New System.Drawing.Point(543, 248)
        Me.cmdCancelCalcImpliedVolatility.Name = "cmdCancelCalcImpliedVolatility"
        Me.cmdCancelCalcImpliedVolatility.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelCalcImpliedVolatility.TabIndex = 13
        Me.cmdCancelCalcImpliedVolatility.Text = "Cancel Calc Impl Vol"
        Me.cmdCancelCalcImpliedVolatility.UseVisualStyleBackColor = True
        '
        'cmdCancelCalcOptionPrice
        '
        Me.cmdCancelCalcOptionPrice.Location = New System.Drawing.Point(543, 292)
        Me.cmdCancelCalcOptionPrice.Name = "cmdCancelCalcOptionPrice"
        Me.cmdCancelCalcOptionPrice.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelCalcOptionPrice.TabIndex = 15
        Me.cmdCancelCalcOptionPrice.Text = "Cancel Calc Opt Price"
        Me.cmdCancelCalcOptionPrice.UseVisualStyleBackColor = True
        '
        'cmdReqGlobalCancel
        '
        Me.cmdReqGlobalCancel.Location = New System.Drawing.Point(544, 666)
        Me.cmdReqGlobalCancel.Name = "cmdReqGlobalCancel"
        Me.cmdReqGlobalCancel.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqGlobalCancel.TabIndex = 32
        Me.cmdReqGlobalCancel.Text = "Global Cancel"
        Me.cmdReqGlobalCancel.UseVisualStyleBackColor = True
        '
        'cmdReqMarketDataType
        '
        Me.cmdReqMarketDataType.Location = New System.Drawing.Point(543, 689)
        Me.cmdReqMarketDataType.Name = "cmdReqMarketDataType"
        Me.cmdReqMarketDataType.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqMarketDataType.TabIndex = 33
        Me.cmdReqMarketDataType.Text = "Req Mkt Data Type"
        Me.cmdReqMarketDataType.UseVisualStyleBackColor = True
        '
        'cmdCancelMktData
        '
        Me.cmdCancelMktData.BackColor = System.Drawing.SystemColors.Control
        Me.cmdCancelMktData.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdCancelMktData.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdCancelMktData.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdCancelMktData.Location = New System.Drawing.Point(544, 28)
        Me.cmdCancelMktData.Name = "cmdCancelMktData"
        Me.cmdCancelMktData.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdCancelMktData.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelMktData.TabIndex = 3
        Me.cmdCancelMktData.Text = "Cancel Mkt Data..."
        Me.cmdCancelMktData.UseVisualStyleBackColor = False
        '
        'cmdReqPositions
        '
        Me.cmdReqPositions.Location = New System.Drawing.Point(544, 711)
        Me.cmdReqPositions.Name = "cmdReqPositions"
        Me.cmdReqPositions.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqPositions.TabIndex = 34
        Me.cmdReqPositions.Text = "Req Positions"
        Me.cmdReqPositions.UseVisualStyleBackColor = True
        '
        'cmdReqAccountSummary
        '
        Me.cmdReqAccountSummary.Location = New System.Drawing.Point(544, 759)
        Me.cmdReqAccountSummary.Name = "cmdReqAccountSummary"
        Me.cmdReqAccountSummary.Size = New System.Drawing.Size(134, 21)
        Me.cmdReqAccountSummary.TabIndex = 36
        Me.cmdReqAccountSummary.Text = "Req Acct Summary"
        Me.cmdReqAccountSummary.UseVisualStyleBackColor = True
        '
        'cmdCancelAccountSummary
        '
        Me.cmdCancelAccountSummary.Location = New System.Drawing.Point(544, 782)
        Me.cmdCancelAccountSummary.Name = "cmdCancelAccountSummary"
        Me.cmdCancelAccountSummary.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelAccountSummary.TabIndex = 37
        Me.cmdCancelAccountSummary.Text = "Cancel Acct Summary"
        Me.cmdCancelAccountSummary.UseVisualStyleBackColor = True
        '
        'cmdCancelPositions
        '
        Me.cmdCancelPositions.Location = New System.Drawing.Point(543, 735)
        Me.cmdCancelPositions.Name = "cmdCancelPositions"
        Me.cmdCancelPositions.Size = New System.Drawing.Size(134, 21)
        Me.cmdCancelPositions.TabIndex = 35
        Me.cmdCancelPositions.Text = "Cancel Positions"
        Me.cmdCancelPositions.UseVisualStyleBackColor = True
        '
        'dlgMainWnd
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.ClientSize = New System.Drawing.Size(680, 810)
        Me.Controls.Add(Me.cmdCancelPositions)
        Me.Controls.Add(Me.cmdCancelAccountSummary)
        Me.Controls.Add(Me.cmdReqAccountSummary)
        Me.Controls.Add(Me.cmdReqPositions)
        Me.Controls.Add(Me.cmdReqMarketDataType)
        Me.Controls.Add(Me.cmdReqGlobalCancel)
        Me.Controls.Add(Me.cmdCancelCalcOptionPrice)
        Me.Controls.Add(Me.cmdCancelCalcImpliedVolatility)
        Me.Controls.Add(Me.cmdCalcOptionPrice)
        Me.Controls.Add(Me.cmdCalcImpliedVolatility)
        Me.Controls.Add(Me.cmdWhatIf)
        Me.Controls.Add(Me.cmdReqCurrentTime)
        Me.Controls.Add(Me.cmdCancelRealTimeBars)
        Me.Controls.Add(Me.cmdReqRealTimeBars)
        Me.Controls.Add(Me.cmdCancelHistData)
        Me.Controls.Add(Me.cmdScanner)
        Me.Controls.Add(Me.cmdExerciseOptions)
        Me.Controls.Add(Me.Tws1)
        Me.Controls.Add(Me.cmdReqHistoricalData)
        Me.Controls.Add(Me.cmdFinancialAdvisor)
        Me.Controls.Add(Me.cmdReqAccts)
        Me.Controls.Add(Me.cmdReqAllOpenOrders)
        Me.Controls.Add(Me.cmdReqAutoOpenOrders)
        Me.Controls.Add(Me.cmdServerLogLevel)
        Me.Controls.Add(Me.cmdReqNews)
        Me.Controls.Add(Me.cmdReqAcctData)
        Me.Controls.Add(Me.cmdReqExecutions)
        Me.Controls.Add(Me.cmdReqIds)
        Me.Controls.Add(Me.cmdClearForm)
        Me.Controls.Add(Me.cmdClose)
        Me.Controls.Add(Me.cmdDisconnect)
        Me.Controls.Add(Me.cmdReqMktData)
        Me.Controls.Add(Me.cmdCancelMktData)
        Me.Controls.Add(Me.cmdReqMktDepth)
        Me.Controls.Add(Me.cmdCancelMktDepth)
        Me.Controls.Add(Me.cmdPlaceOrder)
        Me.Controls.Add(Me.cmdCancelOrder)
        Me.Controls.Add(Me.cmdExtendedOrderAtribs)
        Me.Controls.Add(Me.cmdReqContractData)
        Me.Controls.Add(Me.cmdReqOpenOrders)
        Me.Controls.Add(Me.cmdConnect)
        Me.Controls.Add(Me.lstErrors)
        Me.Controls.Add(Me.lstServerResponses)
        Me.Controls.Add(Me.lstMktData)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Cursor = System.Windows.Forms.Cursors.Default
        Me.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.Location = New System.Drawing.Point(348, 193)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "dlgMainWnd"
        Me.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "VB.NET Sample using TWS ActiveX Control"
        CType(Me.Tws1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
#End Region
#Region "Upgrade Support "
    Private Shared m_vb6FormDefInstance As dlgMainWnd
    Private Shared m_InitializingDefInstance As Boolean
    Public Shared Property DefInstance() As dlgMainWnd
        Get
            If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
                m_InitializingDefInstance = True
                m_vb6FormDefInstance = New dlgMainWnd()
                m_InitializingDefInstance = False
            End If
            DefInstance = m_vb6FormDefInstance
        End Get
        Set(ByVal value As dlgMainWnd)
            m_vb6FormDefInstance = value
        End Set
    End Property
#End Region
    '================================================================================
    ' Private Members
    '================================================================================
    ' data members
    Private m_contractInfo As TWSLib.IContract
    Private m_orderInfo As TWSLib.IOrder
    Private m_execFilter As TWSLib.IExecutionFilter
    Private m_underComp As TWSLib.IUnderComp

    Private m_dlgOrder As New dlgOrder
    Private m_dlgConnect As New dlgConnect
    Private m_dlgMktDepth As New dlgMktDepth
    Private m_dlgAcctData As New dlgAcctData
    Private m_utils As New Utils
    Private m_dlgNewsBulletins As New dlgNewsBulletins
    Private m_dlgLogConfig As New dlgLogConfig
    Private m_dlgFinancialAdvisor As New dlgFinancialAdvisor
    Private m_dlgScanner As New dlgScanner

    Private m_faAccount, faError As Boolean
    Private m_faAcctsList As String
    Private faGroupXML, faProfilesXML, faAliasesXML As String
    Dim faErrorCodes(5) As Short
    Dim MKT_DEPTH_DATA_RESET As Integer = 317

    '================================================================================
    ' Public functions
    '================================================================================
    Public ReadOnly Property isFAAccount() As Boolean
        Get
            isFAAccount = m_faAccount
        End Get
    End Property

    Public ReadOnly Property FAManagedAccounts() As String
        Get
            FAManagedAccounts = m_faAcctsList
        End Get
    End Property
    Public Sub requestScannerParameters()
        Call Tws1.reqScannerParameters()
    End Sub
    Public Sub cancelScannerSubscription(ByRef id As Short)
        Call Tws1.cancelScannerSubscription(id)
    End Sub
    Public Sub scannerSubscription(ByVal id As Integer, ByVal subscription As TWSLib.IScannerSubscription)
        Call Tws1.reqScannerSubscriptionEx(id, subscription)
    End Sub

    '================================================================================
    ' Button Events
    '================================================================================
    '--------------------------------------------------------------------------------
    ' Connect this API client to the TWS instance
    '--------------------------------------------------------------------------------
    Private Sub cmdConnect_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdConnect.Click
        ' assume this is a non Financial Advisor account. If it is the managedAccounts()
        ' event will be fired.
        m_faAccount = False

        m_dlgConnect.ShowDialog()
        If m_dlgConnect.ok Then
            With m_dlgConnect
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, _
                     "Connecting to Tws using clientId " & .clientId & " ...")
                Call Tws1.connect(.hostIP, .port, .clientId)
                If (Tws1.serverVersion() > 0) Then
                    Dim msg As String
                    msg = "Connected to Tws server version " & Tws1.serverVersion() & _
                          " at " & Tws1.TwsConnectionTime()
                    Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, msg)
                End If
            End With
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Disconnect this API client from the TWS instance
    '--------------------------------------------------------------------------------
    Private Sub cmdDisconnect_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdDisconnect.Click
        Call Tws1.disconnect()
    End Sub

    '--------------------------------------------------------------------------------
    ' Request market data for a security
    '--------------------------------------------------------------------------------
    Private Sub cmdReqMktData_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqMktData.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.REQ_MKT_DATA_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.reqMktDataEx(m_dlgOrder.orderId, m_contractInfo, _
                    m_dlgOrder.genericTickTags, m_dlgOrder.snapshotMktData)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel market data for a security
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelMktData_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCancelMktData.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CANCEL_MKT_DATA_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.cancelMktData(m_dlgOrder.orderId)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Request market depth for a security
    '--------------------------------------------------------------------------------
    Private Sub cmdReqMktDepth_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqMktDepth.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.REQ_MKT_DEPTH_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then

            m_dlgMktDepth.init()
            Call Tws1.reqMktDepthEx(m_dlgOrder.orderId, m_contractInfo, m_dlgOrder.numRows)
            m_dlgMktDepth.ShowDialog()

            ' unsubscribe to mkt depth when the dialog is closed
            Call Tws1.cancelMktDepth(m_dlgOrder.orderId)

        End If

    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel market depth for a security
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelMktDepth_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCancelMktDepth.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CANCEL_MKT_DEPTH_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.cancelMktDepth(m_dlgOrder.orderId)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Request historical market data for a security
    '--------------------------------------------------------------------------------
    Private Sub cmdReqHistoricalData_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqHistoricalData.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.REQ_HISTORICAL_DATA), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            If m_dlgOrder.whatToShow = "estimates" Or _
               m_dlgOrder.whatToShow = "finstat" Or _
               m_dlgOrder.whatToShow = "snapshot" Then
                Call Tws1.reqFundamentalData(m_dlgOrder.orderId, m_contractInfo, m_dlgOrder.whatToShow)
            Else
                Call Tws1.reqHistoricalDataEx(m_dlgOrder.orderId, m_contractInfo, _
                    m_dlgOrder.histEndDateTime, m_dlgOrder.histDuration, m_dlgOrder.histBarSizeSetting, _
                    m_dlgOrder.whatToShow, m_dlgOrder.useRTH, m_dlgOrder.formatDate)
            End If
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel historical market data for a security
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelHistData_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCancelHistData.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CANCEL_HIST_DATA_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            If m_dlgOrder.whatToShow = "estimates" Or _
               m_dlgOrder.whatToShow = "finstat" Or _
               m_dlgOrder.whatToShow = "snapshot" Then
                Call Tws1.cancelFundamentalData(m_dlgOrder.orderId)
            Else
                Call Tws1.cancelHistoricalData(m_dlgOrder.orderId)
            End If

        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Request real time bars for a security
    '--------------------------------------------------------------------------------
    Private Sub cmdReqRealTimeBars_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdReqRealTimeBars.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.REQ_REAL_TIME_BARS_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.reqRealTimeBarsEx(m_dlgOrder.orderId, m_contractInfo, _
                                        5, m_dlgOrder.whatToShow, m_dlgOrder.useRTH)
        End If

    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel real time bars for a security
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelRealTimeBars_Click(ByVal eventSender As Object, ByVal eventArgs As System.EventArgs) Handles cmdCancelRealTimeBars.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CANCEL_REAL_TIME_BARS_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.cancelRealTimeBars(m_dlgOrder.orderId)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Request current server time
    '--------------------------------------------------------------------------------
    Private Sub cmdReqCurrentTime_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdReqCurrentTime.Click
        Call Tws1.reqCurrentTime()
    End Sub

    '--------------------------------------------------------------------------------
    ' Perform market scans
    '--------------------------------------------------------------------------------
    Private Sub cmdScanner_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdScanner.Click
        m_dlgScanner.ShowDialog()
    End Sub

    '--------------------------------------------------------------------------------
    ' Place a new or modify an existing order
    '--------------------------------------------------------------------------------
    Private Sub cmdWhatIf_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdWhatIf.Click
        placeOrderImpl(True)
    End Sub
    Private Sub cmdPlaceOrder_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdPlaceOrder.Click
        placeOrderImpl(False)
    End Sub
    Private Sub placeOrderImpl(ByVal whatIf As Boolean)

        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.PLACE_ORDER_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Dim savedWhatIf As Boolean
            savedWhatIf = m_orderInfo.whatIf()
            m_orderInfo.whatIf = whatIf
            Call Tws1.placeOrderEx(m_dlgOrder.orderId, m_contractInfo, m_orderInfo)
            m_orderInfo.whatIf = savedWhatIf
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel an exisiting order
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelOrder_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCancelOrder.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CANCEL_ORDER_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.cancelOrder(m_dlgOrder.orderId)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Exercise options
    '--------------------------------------------------------------------------------
    Private Sub cmdExerciseOptions_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdExerciseOptions.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.EXERCISE_OPTIONS), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            ' TODO: get account in a less convoluted way
            Call Tws1.exerciseOptionsEx(m_dlgOrder.orderId, m_contractInfo, _
                            m_dlgOrder.exerciseAction, m_dlgOrder.exerciseQuantity, _
                            m_orderInfo.account, m_dlgOrder.exerciseOverride)
        End If

    End Sub

    '--------------------------------------------------------------------------------
    ' Sets the extended order attributes
    '--------------------------------------------------------------------------------
    Private Sub cmdExtendedOrderAtribs_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdExtendedOrderAtribs.Click
        Dim dlgOrderAttribs As New dlgOrderAttribs

        dlgOrderAttribs.init(Me, m_orderInfo)
        dlgOrderAttribs.ShowDialog()
        ' nothing to do besides that
    End Sub

    '--------------------------------------------------------------------------------
    ' Request the details for a contract
    '--------------------------------------------------------------------------------
    Private Sub cmdReqContractData_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqContractData.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.REQ_CONTRACT_DETAILS_DLG), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Tws1.reqContractDetailsEx(m_dlgOrder.orderId, m_contractInfo)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Request all the API open orders that were placed by this client. Note the
    ' clientID with a client id of 0 returns its, plus the TWS TWS open orders. Once
    ' requested the TWS orders retain their API asociation.
    '--------------------------------------------------------------------------------
    Private Sub cmdReqOpenOrders_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqOpenOrders.Click
        Call Tws1.reqOpenOrders()
    End Sub

    '--------------------------------------------------------------------------------
    ' Request the lsit of all the current open orders (from API clients and TWS). Note
    ' that no API order assoication is made.
    '--------------------------------------------------------------------------------
    Private Sub cmdReqAllOpenOrders_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqAllOpenOrders.Click
        Call Tws1.reqAllOpenOrders()
    End Sub

    '--------------------------------------------------------------------------------
    ' Request that all new TWS orders are automatically associated with this client.
    ' NOTE: This feature is only available for a client with client id of 0.
    '--------------------------------------------------------------------------------
    Private Sub cmdReqAutoOpenOrders_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqAutoOpenOrders.Click
        Call Tws1.reqAutoOpenOrders(True)
    End Sub

    '--------------------------------------------------------------------------------
    ' Requests account details
    '--------------------------------------------------------------------------------
    Private Sub cmdReqAcctData_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqAcctData.Click
        Dim dlg As New dlgAcctUpdates

        dlg.ShowDialog()
        If (dlg.ok) Then
            If dlg.subscribe Then
                m_dlgAcctData.accountDownloadBegin(dlg.acctCode)
            End If
            Call Tws1.reqAccountUpdates(CBool(dlg.subscribe), dlg.acctCode)
            If CBool(dlg.subscribe) Then
                m_dlgAcctData.ShowDialog()
            End If
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Request all todays execution reports
    '--------------------------------------------------------------------------------
    Private Sub cmdReqExecutions_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqExecutions.Click
        Dim dlgExecFilter As New dlgExecFilter

        dlgExecFilter.init(m_execFilter)
        dlgExecFilter.ShowDialog()
        If dlgExecFilter.ok Then
            Call Tws1.reqExecutionsEx(dlgExecFilter.reqId, m_execFilter)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Requests the next avaliable order id for placing an order
    '--------------------------------------------------------------------------------
    Private Sub cmdReqIds_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqIds.Click
        Call Tws1.reqIds(1)
    End Sub

    '--------------------------------------------------------------------------------
    ' Requests to be notified for new IB news bulletins
    '--------------------------------------------------------------------------------
    Private Sub cmdReqNews_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqNews.Click
        m_dlgNewsBulletins.ShowDialog()
        If m_dlgNewsBulletins.ok Then
            If m_dlgNewsBulletins.subscribe = True Then
                Call Tws1.reqNewsBulletins(m_dlgNewsBulletins.allMsgs)
            Else
                Call Tws1.cancelNewsBulletins()
            End If
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Sets the TWS server logging level
    '--------------------------------------------------------------------------------
    Private Sub cmdServerLogLevel_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdServerLogLevel.Click
        m_dlgLogConfig.ShowDialog()
        If m_dlgLogConfig.ok Then
            Call Tws1.setServerLogLevel(m_dlgLogConfig.serverLogLevel())
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Request managed accounts
    '--------------------------------------------------------------------------------
    Private Sub cmdReqAccts_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqAccts.Click
        Call Tws1.reqManagedAccts()
    End Sub
    Private Sub cmdFinancialAdvisor_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdFinancialAdvisor.Click
        faGroupXML = ""
        faProfilesXML = ""
        faAliasesXML = ""
        faError = False
        Call Tws1.requestFA(Utils.FA_Message_Type.ALIASES)
        Call Tws1.requestFA(Utils.FA_Message_Type.GROUPS)
        Call Tws1.requestFA(Utils.FA_Message_Type.PROFILES)
    End Sub

    '--------------------------------------------------------------------------------
    ' Calculate Implied Volatility
    '--------------------------------------------------------------------------------
    Private Sub cmdCalcImpliedVolatility_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCalcImpliedVolatility.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CALCULATE_IMPLIED_VOLATILITY), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.calculateImpliedVolatility(m_dlgOrder.orderId, m_contractInfo, m_orderInfo.lmtPrice, m_orderInfo.auxPrice)
        End If
    End Sub	

    '--------------------------------------------------------------------------------
    ' Calculate Option Price
    '--------------------------------------------------------------------------------
    Private Sub cmdCalcOptionPrice_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCalcOptionPrice.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CALCULATE_OPTION_PRICE), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.calculateOptionPrice(m_dlgOrder.orderId, m_contractInfo, m_orderInfo.lmtPrice, m_orderInfo.auxPrice)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel Calculate Implied Volatility
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelCalcImpliedVolatility_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCancelCalcImpliedVolatility.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CANCEL_CALCULATE_IMPLIED_VOLATILITY), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
        	Call Tws1.cancelCalculateImpliedVolatility(m_dlgOrder.orderId)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel Calculate Option Price
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelCalcOptionPrice_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdCancelCalcOptionPrice.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.CANCEL_CALCULATE_OPTION_PRICE), _
   m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
        	Call Tws1.cancelCalculateOptionPrice(m_dlgOrder.orderId)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Request global cancel
    '--------------------------------------------------------------------------------
    Private Sub cmdReqGlobalCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdReqGlobalCancel.Click
        Call Tws1.reqGlobalCancel()
    End Sub

    '--------------------------------------------------------------------------------
    ' Request market data type
    '--------------------------------------------------------------------------------
    Private Sub cmdReqMarketDataType_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdReqMarketDataType.Click
        ' Set the dialog state
        m_dlgOrder.init((dlgOrder.Dlg_Type.REQ_MARKET_DATA_TYPE), _
            m_contractInfo, m_orderInfo, m_underComp, Me)

        m_dlgOrder.ShowDialog()
        If m_dlgOrder.ok Then
            Call Tws1.reqMarketDataType(m_dlgOrder.marketDataType)
        End If
    End Sub


    '--------------------------------------------------------------------------------
    ' Request positions
    '--------------------------------------------------------------------------------
    Private Sub cmdReqPositions_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdReqPositions.Click
        Call Tws1.reqPositions()
    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel positions
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelPositions_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancelPositions.Click
        Call Tws1.cancelPositions()
    End Sub

    '--------------------------------------------------------------------------------
    ' Request account summary
    '--------------------------------------------------------------------------------
    Private Sub cmdReqAccountSummary_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdReqAccountSummary.Click

        Dim dlgAccountSummary As New dlgAccountSummary

        ' Set the dialog state
        dlgAccountSummary.init(dlgAccountSummary.Dlg_Type.REQUEST_ACCOUNT_SUMMARY)
        dlgAccountSummary.ShowDialog()

        If dlgAccountSummary.ok Then
            Call Tws1.reqAccountSummary(dlgAccountSummary.reqId, dlgAccountSummary.groupName, dlgAccountSummary.tags)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Cancel account summary
    '--------------------------------------------------------------------------------
    Private Sub cmdCancelAccountSummary_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancelAccountSummary.Click

        Dim dlgAccountSummary As New dlgAccountSummary

        ' Set the dialog state
        dlgAccountSummary.init(dlgAccountSummary.Dlg_Type.CANCEL_ACCOUNT_SUMMARY)
        dlgAccountSummary.ShowDialog()

        If dlgAccountSummary.ok Then
            Call Tws1.cancelAccountSummary(dlgAccountSummary.reqId)
        End If
    End Sub

    '--------------------------------------------------------------------------------
    ' Clear the form display lists
    '--------------------------------------------------------------------------------
    Private Sub cmdClearForm_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdClearForm.Click
        lstMktData.Items.Clear()
        lstServerResponses.Items.Clear()
        lstErrors.Items.Clear()
    End Sub

    '--------------------------------------------------------------------------------
    ' Shutdown the app
    '--------------------------------------------------------------------------------
    Private Sub cmdClose_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdClose.Click
        Me.Close()
    End Sub

    '--------------------------------------------------------------------------------
    ' Misc
    '--------------------------------------------------------------------------------
    Public Function TextWidth(ByVal data As String) As Integer
        TextWidth = data.Length() * 10
    End Function
    Public Function ScaleMode() As Integer
        Return 1
    End Function

    '================================================================================
    ' TWS Events
    '================================================================================

    '--------------------------------------------------------------------------------
    ' Returns the next valid order id upon connection - triggered by the connect() and
    ' reqNextValidId() methods
    '--------------------------------------------------------------------------------
    Private Sub Tws1_nextValidId(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_nextValidIdEvent) Handles Tws1.nextValidId
        m_dlgOrder.orderId = eventArgs.id
    End Sub

    '--------------------------------------------------------------------------------
    ' Notify the users of any API request processing errors and displays them in the
    ' server responses listbox
    '--------------------------------------------------------------------------------
    Private Sub Tws1_errMsg(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_errMsgEvent) Handles Tws1.errMsg
        Dim msg As String
        Dim ctr As Short

        msg = "id: " & eventArgs.id & " | Error Code: " & eventArgs.errorCode & " | Error Msg: " & eventArgs.errorMsg
        Call m_utils.addListItem(Utils.List_Types.ERRORS, msg)

        ' move into view
        lstErrors.TopIndex = lstErrors.Items.Count - 1

        For ctr = 0 To 5
            If eventArgs.errorCode = faErrorCodes(ctr) Then faError = True
        Next ctr

        If eventArgs.errorCode = MKT_DEPTH_DATA_RESET Then
            m_dlgMktDepth.clear()
        End If

    End Sub

    '--------------------------------------------------------------------------------
    ' Notification that the TWS-API connection has been broken.
    '--------------------------------------------------------------------------------
    Private Sub Tws1_connectionClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Tws1.connectionClosed
        Call m_utils.addListItem(Utils.List_Types.ERRORS, "Connection to Tws has been closed")

        ' move into view
        lstErrors.TopIndex = lstErrors.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Market data price tick event - triggered by the reqMktDataEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_tickPrice(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_tickPriceEvent) Handles Tws1.tickPrice
        Dim mktDataStr As String

        mktDataStr = "id=" & eventArgs.id & " " & m_utils.getField(eventArgs.tickType) & "=" & eventArgs.price
        If (eventArgs.canAutoExecute <> 0) Then
            mktDataStr = mktDataStr & " canAutoExecute"
        Else
            mktDataStr = mktDataStr & " noAutoExecute"
        End If
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Market data size tick event - triggered by the reqMktDataEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_tickSize(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_tickSizeEvent) Handles Tws1.tickSize
        Dim mktDataStr As String

        mktDataStr = "id=" & eventArgs.id & " " & m_utils.getField(eventArgs.tickType) & "=" & eventArgs.size
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Market data generic tick event - triggered by the reqMktDataEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_tickGeneric(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_tickGenericEvent) Handles Tws1.tickGeneric
        Dim mktDataStr As String

        mktDataStr = "id=" & eventArgs.id & " " & m_utils.getField(eventArgs.tickType) & "=" & eventArgs.value
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Market data string tick event - triggered by the reqMktDataEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_tickString(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_tickStringEvent) Handles Tws1.tickString
        Dim mktDataStr As String

        mktDataStr = "id=" & eventArgs.id & " " & m_utils.getField(eventArgs.tickType) & "=" & eventArgs.value
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Market data EFP computation event - triggered by the reqMktDataEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_tickEFP(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_tickEFPEvent) Handles Tws1.tickEFP
        Dim mktDataStr As String
        mktDataStr = "id=" & eventArgs.tickerId & " " & m_utils.getField(eventArgs.field) & ":" & _
             eventArgs.basisPoints & " / " & eventArgs.formattedBasisPoints & _
             " totalDividends=" & eventArgs.totalDividends & " holdDays=" & eventArgs.holdDays & _
             " futureExpiry=" & eventArgs.futureExpiry & " dividendImpact=" & eventArgs.dividendImpact & _
             " dividendsToExpiry=" & eventArgs.dividendsToExpiry

        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Market data option computation tick event - triggered by the reqMktDataEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_tickOptionComputation(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_tickOptionComputationEvent) Handles Tws1.tickOptionComputation
        Dim mktDataStr As String, volStr As String, deltaStr As String, gammaStr As String, vegaStr As String, _
            thetaStr As String, optPriceStr As String, pvDividendStr As String, undPriceStr As String

        If eventArgs.impliedVol = Double.MaxValue Or eventArgs.impliedVol < 0 Then
            volStr = "N/A"
        Else
            volStr = eventArgs.impliedVol
        End If
        If eventArgs.delta = Double.MaxValue Or Math.Abs(eventArgs.delta) > 1 Then
            deltaStr = "N/A"
        Else
            deltaStr = eventArgs.delta
        End If
        If eventArgs.gamma = Double.MaxValue Or Math.Abs(eventArgs.gamma) > 1 Then
            gammaStr = "N/A"
        Else
            gammaStr = eventArgs.gamma
        End If
        If eventArgs.vega = Double.MaxValue Or Math.Abs(eventArgs.vega) > 1 Then
            vegaStr = "N/A"
        Else
            vegaStr = eventArgs.vega
        End If
        If eventArgs.theta = Double.MaxValue Or Math.Abs(eventArgs.theta) > 1 Then
            thetaStr = "N/A"
        Else
            thetaStr = eventArgs.theta
        End If
        If eventArgs.optPrice = Double.MaxValue Then
            optPriceStr = "N/A"
        Else
            optPriceStr = eventArgs.optPrice
        End If
        If eventArgs.pvDividend = Double.MaxValue Then
            pvDividendStr = "N/A"
        Else
            pvDividendStr = eventArgs.pvDividend
        End If
        If eventArgs.undPrice = Double.MaxValue Then
            undPriceStr = "N/A"
        Else
            undPriceStr = eventArgs.undPrice
        End If
        mktDataStr = "id = " & eventArgs.id & " " & m_utils.getField(eventArgs.tickType) & " vol = " & volStr & " delta = " & deltaStr & _
            " gamma = " & gammaStr & " vega = " & vegaStr & " theta = " & thetaStr & _
            " optPrice = " & optPriceStr & " pvDividend = " & pvDividendStr & " undPrice = " & undPriceStr
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)
    End Sub

    '--------------------------------------------------------------------------------
    ' Market depth book entry - triggered by the reqMktDepthEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_updateMktDepth(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_updateMktDepthEvent) Handles Tws1.updateMktDepth
        m_dlgMktDepth.updateMktDepth(eventArgs.id, eventArgs.position, " ", eventArgs.operation, eventArgs.side, eventArgs.price, eventArgs.size)
    End Sub

    '--------------------------------------------------------------------------------
    ' Market depth Level II book entry - triggered by the reqMktDepthEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_updateMktDepthL2(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_updateMktDepthL2Event) Handles Tws1.updateMktDepthL2
        m_dlgMktDepth.updateMktDepth(eventArgs.id, eventArgs.position, eventArgs.marketMaker, eventArgs.operation, eventArgs.side, eventArgs.price, eventArgs.size)
    End Sub

    '--------------------------------------------------------------------------------
    ' Historical data tick event - triggered by the reqHistoricalDataEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_historicalData(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_historicalDataEvent) Handles Tws1.historicalData
        Dim mktDataStr As String
        mktDataStr = "id=" & eventArgs.reqId & " date=" & eventArgs.date & " open=" & eventArgs.open & " high=" & eventArgs.high & _
                     " low=" & eventArgs.low & " close=" & eventArgs.close & " volume=" & eventArgs.volume & _
                     " barCount=" & eventArgs.barCount & " WAP=" & eventArgs.wAP
        If (eventArgs.hasGaps <> 0) Then
            mktDataStr = mktDataStr & " has gaps"
        Else
            mktDataStr = mktDataStr & " no gaps"
        End If
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Real Time Bar event - triggered by the reqRealTimeBarEx() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_realtimeBar(ByVal eventSender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_realtimeBarEvent) Handles Tws1.realtimeBar

        Dim mktDataStr As String
        mktDataStr = "id=" & eventArgs.tickerId & " time=" & eventArgs.time & " open=" & eventArgs.open & " high=" & eventArgs.high & _
                     " low=" & eventArgs.low & " close=" & eventArgs.close & " volume=" & eventArgs.volume & " WAP=" & eventArgs.wAP & " count=" & eventArgs.count

        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Fundamental Data event - triggered by the reqFundamentalData() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_fundamentalData(ByVal eventSender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_fundamentalDataEvent) Handles Tws1.fundamentalData

        With eventArgs
            Call m_utils.addListItem(Utils.List_Types.MKT_DATA, "fund reqId=" & .reqId & " len=" & Len(.Data))
            Call m_utils.displayMultiline(Utils.List_Types.MKT_DATA, .Data)
        End With

    End Sub

    '--------------------------------------------------------------------------------
    ' Current Time event - triggered by the reqCurrentTime() methods
    '--------------------------------------------------------------------------------
    Private Sub Tws1_currentTime(ByVal sender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_currentTimeEvent) Handles Tws1.currentTime

        Dim displayString As String
        displayString = "current time = " & eventArgs.time

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, displayString)

        ' move into view
        lstServerResponses.TopIndex = lstServerResponses.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Market Scanner related events
    '--------------------------------------------------------------------------------
    Private Sub Tws1_scannerParameters(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_scannerParametersEvent) Handles Tws1.scannerParameters
        Dim xmlDoc As XmlDocument
        xmlDoc = ProduceXMLDoc()
        Call xmlDoc.LoadXml(eventArgs.xml)
        Dim node1 As XmlNode
        node1 = getRootNode(xmlDoc)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "SCANNER PARAMETERS " & node1.Name & " document.")
        node1 = node1.SelectSingleNode("InstrumentList")
        Dim name2, name1, theType1, theType2 As String
        name1 = parseNode(node1.FirstChild, "name")
        theType1 = parseNode(node1.FirstChild, "type")
        name2 = parseNode(node1.FirstChild.NextSibling, "name")
        theType2 = parseNode(node1.FirstChild.NextSibling, "type")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "InstrumentList starts with (" & name1 & "," & theType1 & ") " & "followed by (" & name2 & "," & theType2 & ")")
        Call m_utils.displayMultiline(Utils.List_Types.SERVER_RESPONSES, (eventArgs.xml))
    End Sub
    Private Sub Tws1_scannerDataEx(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_scannerDataExEvent) Handles Tws1.scannerDataEx
        Dim mktDataStr As String

        Dim contractDetails As TWSLib.IContractDetails
        contractDetails = eventArgs.contractDetails

        Dim contract As TWSLib.IContract
        contract = contractDetails.summary

        mktDataStr = "id=" & eventArgs.reqId & " rank=" & eventArgs.rank & " conId=" & contract.conId & _
                     " symbol=" & contract.symbol & " secType=" & contract.secType & " currency=" & contract.currency & _
                     " localSymbol=" & contract.localSymbol & " marketName=" & contractDetails.marketName & _
                     " tradingClass=" & contract.tradingClass & " distance=" & eventArgs.distance & _
                     " benchmark=" & eventArgs.benchmark & " projection=" & eventArgs.projection & _
                     " legsStr=" & eventArgs.legsStr
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, mktDataStr)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub
    Private Sub Tws1_scannerDataEnd(ByVal sender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_scannerDataEndEvent) Handles Tws1.scannerDataEnd
        Dim str As String

        str = "id=" & eventArgs.reqId & " =============== end ==============="
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, str)

        ' move into view
        lstMktData.TopIndex = lstMktData.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Notification of an updates order status - triggered by an order state change.
    '--------------------------------------------------------------------------------
    Private Sub Tws1_orderStatus(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_orderStatusEvent) Handles Tws1.orderStatus
        Dim msg As String

        msg = "order status: orderId=" & eventArgs.id & " client id=" & eventArgs.clientId & " permId=" & eventArgs.permId & _
              " status=" & eventArgs.status & " filled=" & eventArgs.filled & " remaining=" & eventArgs.remaining & _
              " avgFillPrice=" & eventArgs.avgFillPrice & " lastFillPrice=" & eventArgs.lastFillPrice & _
              " parentId=" & eventArgs.parentId & " whyHeld=" & eventArgs.whyHeld

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, msg)

        ' move into view
        lstServerResponses.TopIndex = lstServerResponses.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' The details for a requested contract - triggered by the reqContractDetailsEx method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_contractDetailsEx(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_contractDetailsExEvent) Handles Tws1.contractDetailsEx

        Dim reqId As Long
        reqId = eventArgs.reqId

        Dim contractDetails As TWSLib.IContractDetails
        contractDetails = eventArgs.contractDetails

        Dim contract As TWSLib.IContract
        contract = contractDetails.summary

        Dim offset As Long
        offset = lstServerResponses.Items.Count

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "reqId = " & reqId & " ===================================")

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Contract Details Begin ----")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Contract:")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  conId = " & contract.conId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  symbol = " & contract.symbol)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  secType = " & contract.secType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  expiry = " & contract.expiry)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  strike = " & contract.strike)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  right = " & contract.right)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  multiplier = " & contract.multiplier)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  exchange = " & contract.exchange)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  primaryExchange = " & contract.primaryExchange)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  currency = " & contract.currency)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  localSymbol = " & contract.localSymbol)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  tradingClass = " & contract.tradingClass)

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Details:")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  marketName = " & contractDetails.marketName)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  minTick = " & contractDetails.minTick)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  priceMagnifier = " & contractDetails.priceMagnifier)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  orderTypes = " & contractDetails.orderTypes)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  validExchanges = " & contractDetails.validExchanges)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  underConId = " & contractDetails.underConId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  longName = " & contractDetails.longName)

        If (contract.secType <> "BOND") Then
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  contractMonth = " & contractDetails.contractMonth)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  industry = " & contractDetails.industry)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  category = " & contractDetails.category)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  subcategory = " & contractDetails.subcategory)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  timeZoneId = " & contractDetails.timeZoneId)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  tradingHours = " & contractDetails.tradingHours)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  liquidHours = " & contractDetails.liquidHours)
        End If
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  evRule = " & contractDetails.evRule)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  evMultiplier = " & contractDetails.evMultiplier)

        If (contract.secType = "BOND") Then

            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Bond Details:")
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  cusip = " & contractDetails.cusip)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  ratings = " & contractDetails.ratings)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  descAppend = " & contractDetails.descAppend)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  bondType = " & contractDetails.bondType)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  couponType = " & contractDetails.couponType)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  callable = " & contractDetails.callable)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  putable = " & contractDetails.putable)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  coupon = " & contractDetails.coupon)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  convertible = " & contractDetails.convertible)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  maturity = " & contractDetails.maturity)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  issueDate = " & contractDetails.issueDate)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  nextOptionDate = " & contractDetails.nextOptionDate)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  nextOptionType = " & contractDetails.nextOptionType)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  nextOptionPartial = " & contractDetails.nextOptionPartial)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  notes = " & contractDetails.notes)


        End If

        ' CUSIP/ISIN/etc.
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  secIdList={")
        Dim secIdList As TWSLib.ITagValueList
        secIdList = contractDetails.secIdList
        If (Not secIdList Is Nothing) Then
            Dim secIdListCount As Long
            secIdListCount = secIdList.Count
            Dim iLoop As Long
            For iLoop = 0 To secIdListCount - 1
                Dim param As TWSLib.ITagValue
                param = secIdList.Item(iLoop)
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "    " & param.tag & "=" & param.value)
            Next iLoop
        End If
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  }")

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Contract Details End ----")

        ' move into view
        lstServerResponses.TopIndex = offset
    End Sub
    Private Sub Tws1_contractDetailsEnd(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_contractDetailsEndEvent) Handles Tws1.contractDetailsEnd

        Dim reqId As Long
        reqId = eventArgs.reqId

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "reqId = " & reqId & " =============== end ===============")

        ' move into view
        lstServerResponses.TopIndex = lstServerResponses.Items.Count - 1

    End Sub

    '--------------------------------------------------------------------------------
    ' Returns the details for an open order - triggered by the reqOpenOrders() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_openOrderEx(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_openOrderExEvent) Handles Tws1.openOrderEx

        Dim contract As TWSLib.IContract
        contract = eventArgs.contract

        Dim order As TWSLib.IOrder
        order = eventArgs.order

        Dim orderState As TWSLib.IOrderState
        orderState = eventArgs.orderState

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "OpenOrderEx called, orderId=" & eventArgs.orderId)

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Order:")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  orderId=" & order.orderId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  clientId=" & order.clientId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  permId=" & order.permId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  action=" & order.Action)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  quantity=" & order.totalQuantity)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  orderType=" & order.orderType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  lmtPrice=" & DblMaxStr(order.lmtPrice))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  auxPrice=" & DblMaxStr(order.auxPrice))

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Contract:")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  conId=" & contract.conId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  symbol=" & contract.symbol)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  secType=" & contract.secType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  expiry=" & contract.expiry)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  strike=" & contract.strike)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  right=" & contract.right)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  multiplier=" & contract.multiplier)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  exchange=" & contract.exchange)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  primaryExchange=" & contract.primaryExchange)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  currency=" & contract.Currency)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  localSymbol=" & contract.localSymbol)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  tradingClass=" & contract.tradingClass)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  comboLegsDescrip=" & contract.comboLegsDescrip)

        ' combo legs
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  comboLegs={")

        If Not contract.comboLegs Is Nothing Then
            Dim comboLegsCount As Long
            Dim orderComboLegsCount As Long
            comboLegsCount = contract.comboLegs.Count
            orderComboLegsCount = 0

            If Not order.orderComboLegs Is Nothing Then
                orderComboLegsCount = order.orderComboLegs.Count()
            End If

            Dim iLoop As Long
            For iLoop = 0 To comboLegsCount - 1
                Dim comboLeg As TWSLib.IComboLeg
                comboLeg = contract.comboLegs.Item(iLoop)
                Dim orderComboLegPriceStr As String
                orderComboLegPriceStr = ""

                If comboLegsCount = orderComboLegsCount Then
                    Dim orderComboLeg As TWSLib.IOrderComboLeg
                    orderComboLeg = order.orderComboLegs.Item(iLoop)
                    orderComboLegPriceStr = " price=" & DblMaxStr(orderComboLeg.price)
                End If

                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "    leg " & (iLoop + 1) & _
                ": conId=" & comboLeg.conId & " ratio=" & comboLeg.ratio & " action=" & comboLeg.action & _
                " exchange = " & comboLeg.exchange & " openClose=" & comboLeg.openClose & _
                " shortSaleSlot=" & comboLeg.shortSaleSlot & " designatedLocation=" & comboLeg.designatedLocation & _
                " exemptCode=" & comboLeg.exemptCode & orderComboLegPriceStr)
            Next iLoop
        End If
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  }")

        Dim underComp As TWSLib.IUnderComp
        underComp = contract.underComp

        If (Not underComp Is Nothing) Then
            With underComp
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  underComp.conId=" & .conId)
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  underComp.delta=" & .delta)
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  underComp.delta=" & .price)
            End With
        End If


        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Order (extended):")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  timeInForce=" & order.timeInForce)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  ocaGroup=" & order.ocaGroup)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  ocaType=" & order.ocaType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  orderRef=" & order.orderRef)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  transmit=" & order.transmit)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  parentId=" & order.parentId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  blockOrder=" & order.blockOrder)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  sweepToFill=" & order.sweepToFill)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  displaySize=" & order.displaySize)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  triggerMethod=" & order.triggerMethod)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  outsideRth=" & order.outsideRth)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  hidden=" & order.hidden)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  goodAfterTime=" & order.goodAfterTime)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  goodTillDate=" & order.goodTillDate)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  overridePercentageConstraints=" & order.overridePercentageConstraints)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  rule80A=" & order.rule80A)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  allOrNone=" & order.allOrNone)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  minQty=" & IntMaxStr(order.minQty))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  percentOffset=" & DblMaxStr(order.percentOffset))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  trailStopPrice=" & DblMaxStr(order.trailStopPrice))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  trailingPercent=" & DblMaxStr(order.trailingPercent))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  whatIf=" & order.whatIf)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  notHeld=" & order.notHeld)

        ' Financial advisors only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  faGroup=" & order.faGroup)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  faProfile=" & order.faProfile)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  faMethod=" & order.faMethod)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  faPercentage=" & order.faPercentage)

        ' Clearing info
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  account=" & order.account)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  settlingFirm=" & order.settlingFirm)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  clearingAccount=" & order.clearingAccount)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  clearingIntent=" & order.clearingIntent)

        ' Institutional orders only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  openClose=" & order.openClose)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  origin=" & order.origin)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  shortSaleSlot=" & order.shortSaleSlot)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  designatedLocation=" & order.designatedLocation)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  exemptCode=" & order.exemptCode)

        ' SMART routing only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  discretionaryAmt=" & order.discretionaryAmt)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  eTradeOnly=" & order.eTradeOnly)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  firmQuoteOnly=" & order.firmQuoteOnly)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  nbboPriceCap=" & DblMaxStr(order.nbboPriceCap))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  optOutSmartRouting=" & order.optOutSmartRouting)

        ' BOX or VOL orders only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  auctionStrategy=" & order.auctionStrategy)

        ' BOX order only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  startingPrice=" & DblMaxStr(order.startingPrice))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  stockRefPrice=" & DblMaxStr(order.stockRefPrice))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  delta=" & DblMaxStr(order.delta))

        ' pegged to stock or VOL orders
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  stockRangeLower=" & DblMaxStr(order.stockRangeLower))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  stockRangeUpper=" & DblMaxStr(order.stockRangeUpper))

        ' VOLATILITY orders only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  volatility=" & DblMaxStr(order.volatility))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  volatilityType=" & order.volatilityType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  continuousUpdate=" & order.continuousUpdate)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  referencePriceType=" & order.referencePriceType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralOrderType=" & order.deltaNeutralOrderType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralAuxPrice=" & DblMaxStr(order.deltaNeutralAuxPrice))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralConId=" & order.deltaNeutralConId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralSettlingFirm=" & order.deltaNeutralSettlingFirm)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralClearingAccount=" & order.deltaNeutralClearingAccount)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralClearingIntent=" & order.deltaNeutralClearingIntent)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralOpenClose=" & order.deltaNeutralOpenClose)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralShortSale=" & order.deltaNeutralShortSale)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralShortSaleSlot=" & order.deltaNeutralShortSaleSlot)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  deltaNeutralDesignatedlocation=" & order.deltaNeutralDesignatedLocation)

        ' COMBO orders only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  basisPoints=" & DblMaxStr(order.basisPoints))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  basisPointsType=" & IntMaxStr(order.basisPointsType))

        ' SCALE orders only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scaleInitLevelSize=" & IntMaxStr(order.scaleInitLevelSize))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scaleSubsLevelSize=" & IntMaxStr(order.scaleSubsLevelSize))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scalePriceIncrement=" & DblMaxStr(order.scalePriceIncrement))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scalePriceAdjustValue=" & DblMaxStr(order.scalePriceAdjustValue))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scalePriceAdjustInterval=" & IntMaxStr(order.scalePriceAdjustInterval))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scaleProfitOffset=" & DblMaxStr(order.scaleProfitOffset))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scaleAutoReset=" & order.scaleAutoReset)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scaleInitPosition=" & IntMaxStr(order.scaleInitPosition))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scaleInitFillQty=" & IntMaxStr(order.scaleInitFillQty))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  scaleRandomPercent=" & IntMaxStr(order.scaleRandomPercent))

        ' HEDGE orders only
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  hedgeType=" & order.hedgeType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  hedgeParam=" & order.hedgeParam)

        ' ALGO orders only
        Dim algoStrategy As String
        algoStrategy = order.algoStrategy
        If (algoStrategy <> "") Then
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  algoStrategy=" & algoStrategy)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  algoParams={")
            Dim algoParams As TWSLib.ITagValueList
            algoParams = order.algoParams
            If (Not algoParams Is Nothing) Then
                Dim algoParamsCount As Long
                algoParamsCount = algoParams.Count
                Dim iLoop As Long
                For iLoop = 0 To algoParamsCount - 1
                    Dim param As TWSLib.ITagValue
                    param = algoParams.Item(iLoop)
                    Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "    " & param.tag & "=" & param.value)
                Next iLoop
            End If
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  }")
        End If

        ' Smart combo routing params
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  smartComboRoutingParams={")
        Dim smartComboRoutingParams As TWSLib.ITagValueList
        smartComboRoutingParams = order.smartComboRoutingParams
        If (Not smartComboRoutingParams Is Nothing) Then
            Dim smartComboRoutingParamsCount As Long
            smartComboRoutingParamsCount = smartComboRoutingParams.Count
            Dim iLoop As Long
            For iLoop = 0 To smartComboRoutingParamsCount - 1
                Dim param As TWSLib.ITagValue
                param = smartComboRoutingParams.Item(iLoop)
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "    " & param.tag & "=" & param.value)
            Next iLoop
        End If
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  }")

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "OrderState:")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  status=" & orderState.status)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  initMargin=" & orderState.initMargin)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  maintMargin=" & orderState.maintMargin)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  equityWithLoan=" & orderState.equityWithLoan)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  commission=" & DblMaxStr(orderState.commission))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  minCommission=" & DblMaxStr(orderState.minCommission))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  maxCommission=" & DblMaxStr(orderState.maxCommission))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  comissionCurrency=" & orderState.commissionCurrency)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  warningText=" & orderState.warningText)

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "===============================")

    End Sub
    Private Sub Tws1_openOrderEnd(ByVal sender As Object, ByVal e As System.EventArgs) Handles Tws1.openOrderEnd

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "============= end =============")

        ' move into view
        lstServerResponses.TopIndex = lstServerResponses.Items.Count - 1

    End Sub

    Private Sub Tws1_deltaNeutralValidation(ByVal eventSender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_deltaNeutralValidationEvent) Handles Tws1.deltaNeutralValidation

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "deltaNeutralValidation called, reqId=" & eventArgs.reqId)

        Dim underComp As TWSLib.IUnderComp
        underComp = eventArgs.underComp

        If (Not underComp Is Nothing) Then
            With underComp
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  underComp.conId=" & .conId)
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  underComp.delta=" & .delta)
                Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  underComp.delta=" & .price)
            End With
        End If

    End Sub

    Private Sub Tws1_tickSnapshotEnd(ByVal eventSender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_tickSnapshotEndEvent) Handles Tws1.tickSnapshotEnd

        Dim reqId As Long
        reqId = eventArgs.reqId

        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, "id=" & reqId & " =============== end ===============")

        ' move into view
        lstServerResponses.TopIndex = lstServerResponses.Items.Count - 1

    End Sub

    '--------------------------------------------------------------------------------
    ' Notification of an updated/new portfolio position - triggered by the reqAcctUpdates() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_updatePortfolioEx(ByVal sender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_updatePortfolioExEvent) Handles Tws1.updatePortfolioEx
        m_dlgAcctData.updatePortfolio(eventArgs.contract, eventArgs.position, eventArgs.marketPrice, eventArgs.marketValue, eventArgs.averageCost, eventArgs.unrealizedPNL, eventArgs.realizedPNL, eventArgs.accountName)
    End Sub

    '--------------------------------------------------------------------------------
    ' Notification of a server time update - triggered by the reqAcctUpdates() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_updateAccountTime(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_updateAccountTimeEvent) Handles Tws1.updateAccountTime
        m_dlgAcctData.updateAccountTime(eventArgs.timeStamp)
    End Sub

    '--------------------------------------------------------------------------------
    ' Notification of an account proprty update - triggered by the reqAcctUpdates() method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_updateAccountValue(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_updateAccountValueEvent) Handles Tws1.updateAccountValue
        m_dlgAcctData.updateAccountValue(eventArgs.key, eventArgs.value, eventArgs.curency, eventArgs.accountName)
    End Sub

    Private Sub Tws1_accountDownloadEnd(ByVal eventSender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_accountDownloadEndEvent) Handles Tws1.accountDownloadEnd
        Dim accountName As String
        accountName = eventArgs.accountName
        m_dlgAcctData.accountDownloadEnd(accountName)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Account Download End:" & accountName)
    End Sub

    '--------------------------------------------------------------------------------
    ' An order execution report. This event is triggered by the explicit request for
    ' execution reports reqExecutionDetials(), and also by order state changes method
    '--------------------------------------------------------------------------------
    Private Sub Tws1_execDetailsEx(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_execDetailsExEvent) Handles Tws1.execDetailsEx

        Dim contract As TWSLib.IContract
        contract = eventArgs.contract

        Dim execution As TWSLib.IExecution
        execution = eventArgs.execution

        Dim offset As Long
        offset = lstServerResponses.Items.Count

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Execution Details begin ----")

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "reqId = " & eventArgs.reqId)

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Contract:")
        With contract

            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  conId=" & .conId)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  symbol=" & .symbol)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  secType=" & .secType)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  expiry=" & .expiry)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  strike=" & .strike)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  right=" & .right)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  multiplier=" & .multiplier)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  exchange=" & .exchange)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  primaryExchange=" & .primaryExchange)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  currency=" & .currency)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  localSymbol=" & .localSymbol)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  tradingClass=" & .tradingClass)

        End With

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Execution:")
        With execution

            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  execId = " & .execId)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  orderId = " & .orderId)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  clientId = " & .clientId)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  permId = " & .permId)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  time = " & .time)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  acctNumber = " & .acctNumber)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  exchange = " & .exchange)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  side = " & .side)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  shares = " & .shares)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  price = " & .price)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  liquidation = " & .liquidation)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  cumQty = " & .cumQty)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  avgPrice = " & .avgPrice)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  orderRef = " & .orderRef)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  evRule = " & .evRule)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  evMultiplier = " & .evMultiplier)

        End With

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Execution Details End ----")

        ' move into view
        lstServerResponses.TopIndex = offset

    End Sub
    Private Sub Tws1_execDetailsEnd(ByVal eventSender As Object, ByVal eventArgs As AxTWSLib._DTwsEvents_execDetailsEndEvent) Handles Tws1.execDetailsEnd

        Dim reqId As Long
        reqId = eventArgs.reqId

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "reqId = " & reqId & " =============== end ===============")

        ' move into view
        lstServerResponses.TopIndex = lstServerResponses.Items.Count - 1

    End Sub

    '--------------------------------------------------------------------------------
    ' Notification of a new IB news bulletin
    '--------------------------------------------------------------------------------
    Private Sub Tws1_updateNewsBulletin(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_updateNewsBulletinEvent) Handles Tws1.updateNewsBulletin
        Dim msg As String
        Dim dlg As New dlgServerResponse
        msg = " MsgId=" & eventArgs.msgId & " :: MsgType=" & eventArgs.msgType & " :: Origin=" & eventArgs.origExchange & " :: Message=" & eventArgs.message

        dlg.Text = "IB News Bulletin"
        dlg.lblMsg.Text = msg
        dlg.Show()
    End Sub

    '--------------------------------------------------------------------------------
    ' Notification of the FA managed accounts (comma delimited list of account codes)
    '--------------------------------------------------------------------------------
    Private Sub Tws1_managedAccounts(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_managedAccountsEvent) Handles Tws1.managedAccounts
        Dim msg As String

        msg = "Connected : The list of managed accounts are : [" & eventArgs.accountsList & "]"
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, msg)

        m_faAccount = True
        m_faAcctsList = eventArgs.accountsList

    End Sub
    Private Sub Tws1_receiveFA(ByVal eventSender As System.Object, ByVal eventArgs As AxTWSLib._DTwsEvents_receiveFAEvent) Handles Tws1.receiveFA
        Dim fname As String

        fname = m_utils.faMsgTypeName(eventArgs.faDataType)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "FA: " & fname & "=" & eventArgs.cxml)
        Select Case eventArgs.faDataType
            Case Utils.FA_Message_Type.GROUPS
                faGroupXML = eventArgs.cxml
            Case Utils.FA_Message_Type.PROFILES
                faProfilesXML = eventArgs.cxml
            Case Utils.FA_Message_Type.ALIASES
                faAliasesXML = eventArgs.cxml
        End Select

        If faError = False And faGroupXML <> "" And faProfilesXML <> "" And faAliasesXML <> "" Then

            m_dlgFinancialAdvisor.init(m_utils, faGroupXML, faProfilesXML, faAliasesXML)
            m_dlgFinancialAdvisor.ShowDialog()
            If m_dlgFinancialAdvisor.ok Then
                Call Tws1.replaceFA(Utils.FA_Message_Type.GROUPS, m_dlgFinancialAdvisor.groupsXML)
                Call Tws1.replaceFA(Utils.FA_Message_Type.PROFILES, m_dlgFinancialAdvisor.profilesXML)
                Call Tws1.replaceFA(Utils.FA_Message_Type.ALIASES, m_dlgFinancialAdvisor.aliasesXML)
            End If

        End If

    End Sub

    '--------------------------------------------------------------------------------
    ' Market Data Type
    '--------------------------------------------------------------------------------
    Private Sub Tws1_marketDataType(ByVal sender As Object, ByVal e As AxTWSLib._DTwsEvents_marketDataTypeEvent) Handles Tws1.marketDataType
        Dim msg As String

        Select Case e.marketDataType
            Case dlgOrder.MARKET_DATA_TYPE.REALTIME
                msg = "id=" & e.reqId & " marketDataType = Real-Time"
            Case dlgOrder.MARKET_DATA_TYPE.FROZEN
                msg = "id=" & e.reqId & " marketDataType = Frozen"
            Case Else
                msg = "id=" & e.reqId & " marketDataType = Unknown"
        End Select
        Call m_utils.addListItem(Utils.List_Types.MKT_DATA, msg)
    End Sub

    '--------------------------------------------------------------------------------
    ' Commission Report
    '--------------------------------------------------------------------------------
    Private Sub Tws1_commissionReport(ByVal sender As Object, ByVal e As AxTWSLib._DTwsEvents_commissionReportEvent) Handles Tws1.commissionReport
        Dim commissionReport As TWSLib.ICommissionReport
        commissionReport = e.commissionReport

        Dim offset As Long
        offset = lstServerResponses.Items.Count

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Commission Report ----")

        With commissionReport
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  execId=" & .execId)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  commission=" & DblMaxStr(.commission))
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  currency=" & .currency)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  realizedPNL=" & DblMaxStr(.realizedPNL))
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  yield=" & DblMaxStr(.yield))
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  yieldRedemptionDate=" & IntMaxStr(.yieldRedemptionDate))

        End With

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Commission Report End ----")

        ' move into view
        lstServerResponses.TopIndex = offset
    End Sub


    '--------------------------------------------------------------------------------
    ' Position
    '--------------------------------------------------------------------------------
    Private Sub Tws1_position(ByVal sender As Object, ByVal e As AxTWSLib._DTwsEvents_positionEvent) Handles Tws1.position
        Dim contract As TWSLib.IContract
        contract = e.contract

        Dim offset As Long
        offset = lstServerResponses.Items.Count

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Position ----")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "account=" & e.account)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "Contract:")

        With contract
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  conId=" & .conId)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  symbol=" & .symbol)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  secType=" & .secType)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  expiry=" & .expiry)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  strike=" & .strike)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  right=" & .right)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  multiplier=" & .multiplier)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  exchange=" & .exchange)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  primaryExchange=" & .primaryExchange)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  currency=" & .currency)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  localSymbol=" & .localSymbol)
            Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "  tradingClass=" & .tradingClass)
        End With

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "position=" & IntMaxStr(e.position))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "avgCost=" & DblMaxStr(e.avgCost))
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Position End ----")

        ' move into view
        lstServerResponses.TopIndex = offset

    End Sub

    '--------------------------------------------------------------------------------
    ' Position End
    '--------------------------------------------------------------------------------
    Private Sub Tws1_positionEnd(ByVal sender As Object, ByVal e As System.EventArgs) Handles Tws1.positionEnd
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ==== Position End ==== ")

        ' move into view
        lstServerResponses.TopIndex = lstServerResponses.Items.Count - 1
    End Sub

    '--------------------------------------------------------------------------------
    ' Account Summary
    '--------------------------------------------------------------------------------
    Private Sub Tws1_accountSummary(ByVal sender As Object, ByVal e As AxTWSLib._DTwsEvents_accountSummaryEvent) Handles Tws1.accountSummary

        Dim offset As Long
        offset = lstServerResponses.Items.Count

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Account Summary ----")
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "reqId=" & e.reqId)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "account=" & e.account)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "tag=" & e.tag)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "value=" & e.value)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "currency=" & e.curency)
        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, " ---- Account Summary End ----")

        ' move into view
        lstServerResponses.TopIndex = offset
    End Sub

    '--------------------------------------------------------------------------------
    ' Account Summary End
    '--------------------------------------------------------------------------------
    Private Sub Tws1_accountSummaryEnd(ByVal sender As Object, ByVal e As AxTWSLib._DTwsEvents_accountSummaryEndEvent) Handles Tws1.accountSummaryEnd
        Dim reqId As Long
        reqId = e.reqId

        Call m_utils.addListItem(Utils.List_Types.SERVER_RESPONSES, "reqId = " & reqId & " =============== end ===============")

        ' move into view
        lstServerResponses.TopIndex = lstServerResponses.Items.Count - 1

    End Sub

    '================================================================================
    ' Private Methods
    '================================================================================
    Private Sub dlgMainWnd_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load

        Call m_utils.init(Me, m_dlgAcctData)
        Call m_dlgAcctData.init(m_utils)
        Call m_dlgScanner.init(Me)

        faErrorCodes(0) = 503
        faErrorCodes(1) = 504
        faErrorCodes(2) = 505
        faErrorCodes(3) = 522
        faErrorCodes(4) = 1100
        faErrorCodes(5) = 321

        m_contractInfo = Tws1.createContract()
        m_orderInfo = Tws1.createOrder()
        m_execFilter = Tws1.createExecutionFilter()
        m_underComp = Tws1.createUnderComp()

    End Sub

    '================================================================================
    ' XML Utilities
    '================================================================================
    Public Function PopulateXMLDoc(ByVal xmlDoc As XmlDocument, ByVal rootName As String) As XmlElement

        REM this application doesn't need the Processing instruction
        REM Dim node As IXMLDOMNode
        REM Set node = xmlDoc.createProcessingInstruction("xml", "version='1.0'")
        REM xmlDoc.appendChild node
        REM Set node = Nothing

        Dim rootNode As XmlElement
        rootNode = xmlDoc.CreateElement(rootName)
        xmlDoc.AppendChild(rootNode)
        AppendNewLineAndTab(xmlDoc, rootNode)
        PopulateXMLDoc = rootNode
    End Function
    Public Sub AppendNewLineAndTab(ByVal xmlDoc As XmlDocument, ByVal node As XmlNode)
        node.AppendChild(xmlDoc.CreateTextNode(vbNewLine + vbTab))
    End Sub
    Public Sub AppendNewLine(ByVal xmlDoc As XmlDocument, ByVal node As XmlNode)
        node.AppendChild(xmlDoc.CreateTextNode(vbNewLine))
    End Sub
    Public Sub SetElemAttr(ByVal xmlDoc As XmlDocument, ByVal elem As XmlElement, _
                           ByVal attrName As String, ByVal attrValue As String)
        Dim attr As Object
        attr = xmlDoc.CreateAttribute(attrName)
        attr.Value = attrValue
        elem.SetAttributeNode(attr)
        attr = Nothing
    End Sub
    Public Function AddNodeToXMLDoc(ByVal xmlDoc As XmlDocument, _
                                    ByVal node As XmlElement, ByVal nodeName As String, _
                                    ByVal nodeValue As String) As XmlNode
        Dim newNode As XmlElement = xmlDoc.CreateElement(nodeName)
        If nodeValue <> Nothing Then
            newNode.InnerText = nodeValue
        End If
        node.AppendChild(newNode)
        AddNodeToXMLDoc = newNode
    End Function
    Function ProduceXMLDoc() As XmlDocument
        Dim xmlDoc As XmlDocument
        xmlDoc = New XmlDocument
        ' xmlDoc.async = False
        ' xmlDoc.validateOnParse = False
        ' xmlDoc.resolveExternals = False
        ProduceXMLDoc = xmlDoc
    End Function
    Public Function findNode(ByRef xmlDoc As XmlDocument, ByRef nodeName As String, ByRef withName As String, ByRef withValue As String) As XmlNode
        Dim node1 As XmlNode = getRootNode(xmlDoc)
        Dim nodeList As XmlNodeList = getNodeList(node1, nodeName)
        Dim node2 As XmlNode = getNodeFromList(nodeList, withName, withValue)
        Return node2
    End Function
    Public Function removeNode(ByRef xmlDoc As XmlDocument, ByRef nodeName As String, ByRef withName As String, ByRef withValue As String) As XmlNode
        Dim node2 As XmlNode = findNode(xmlDoc, nodeName, withName, withValue)
        If Not IsNothing(node2) Then
            Dim node1 As XmlNode = getRootNode(xmlDoc)
            node1.RemoveChild(node2)
        End If
        Return node2
    End Function
    Public Function getRootNode(ByRef xmlDoc As XmlDocument) As XmlNode
        Return xmlDoc.SelectSingleNode("/*")
    End Function
    Public Function getNode(ByVal node As XmlNode, _
                               ByVal nodeName As String) As XmlNode
        getNode = node.SelectSingleNode(nodeName)
    End Function
    Public Function getNodeList(ByVal node As XmlNode, _
                               ByVal nodeName As String) As XmlNodeList
        getNodeList = node.SelectNodes(nodeName)
    End Function
    Public Function getNodeFromList(ByRef nodeList As XmlNodeList, ByRef name As String, ByRef value As String) As XmlNode
        For ctr As Integer = 0 To nodeList.Count - 1
            Dim node As XmlNode = nodeList.Item(ctr)
            Dim element As XmlElement = node.Item(name)
            If element.InnerText = value Then
                Return node
            End If
        Next
        Return Nothing
    End Function
    Public Function parseNode(ByVal node As XmlNode, _
                               ByVal nodeName As String) As String
        parseNode = node.SelectSingleNode(nodeName).InnerText
    End Function
    Private Function IntMaxStr(ByRef intVal As Integer) As String
        If intVal = Integer.MaxValue Then
            IntMaxStr = ""
        Else
            IntMaxStr = CStr(intVal)
        End If
    End Function
    Private Function DblMaxStr(ByRef dblVal As Double) As String
        If dblVal = Double.MaxValue Then
            DblMaxStr = ""
        Else
            DblMaxStr = CStr(dblVal)
        End If
    End Function
End Class