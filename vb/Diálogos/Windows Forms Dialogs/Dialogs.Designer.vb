<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Dialogs
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.txtFile = New System.Windows.Forms.TextBox()
        Me.btnOpen = New System.Windows.Forms.Button()
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog()
        Me.bthSave = New System.Windows.Forms.Button()
        Me.SaveFileDialog1 = New System.Windows.Forms.SaveFileDialog()
        Me.FontDialog1 = New System.Windows.Forms.FontDialog()
        Me.btnFont = New System.Windows.Forms.Button()
        Me.ColorDialog1 = New System.Windows.Forms.ColorDialog()
        Me.btmColor = New System.Windows.Forms.Button()
        Me.PrintDialog1 = New System.Windows.Forms.PrintDialog()
        Me.btnPrint = New System.Windows.Forms.Button()
        Me.FolderBrowserDialog1 = New System.Windows.Forms.FolderBrowserDialog()
        Me.btnBrowse = New System.Windows.Forms.Button()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'txtFile
        '
        Me.txtFile.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtFile.Location = New System.Drawing.Point(13, 13)
        Me.txtFile.Multiline = True
        Me.txtFile.Name = "txtFile"
        Me.txtFile.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtFile.Size = New System.Drawing.Size(300, 232)
        Me.txtFile.TabIndex = 0
        '
        'btnOpen
        '
        Me.btnOpen.Anchor = CType((System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnOpen.Location = New System.Drawing.Point(349, 13)
        Me.btnOpen.Name = "btnOpen"
        Me.btnOpen.Size = New System.Drawing.Size(75, 23)
        Me.btnOpen.TabIndex = 1
        Me.btnOpen.Text = "Abrir"
        Me.btnOpen.UseVisualStyleBackColor = True
        '
        'OpenFileDialog1
        '
        Me.OpenFileDialog1.FileName = "OpenFileDialog1"
        '
        'bthSave
        '
        Me.bthSave.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.bthSave.Location = New System.Drawing.Point(349, 43)
        Me.bthSave.Name = "bthSave"
        Me.bthSave.Size = New System.Drawing.Size(75, 23)
        Me.bthSave.TabIndex = 2
        Me.bthSave.Text = "Guardar"
        Me.bthSave.UseVisualStyleBackColor = True
        '
        'btnFont
        '
        Me.btnFont.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnFont.Location = New System.Drawing.Point(349, 72)
        Me.btnFont.Name = "btnFont"
        Me.btnFont.Size = New System.Drawing.Size(75, 23)
        Me.btnFont.TabIndex = 3
        Me.btnFont.Text = "Fuentes"
        Me.btnFont.UseVisualStyleBackColor = True
        '
        'btmColor
        '
        Me.btmColor.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btmColor.Location = New System.Drawing.Point(349, 101)
        Me.btmColor.Name = "btmColor"
        Me.btmColor.Size = New System.Drawing.Size(75, 23)
        Me.btmColor.TabIndex = 4
        Me.btmColor.Text = "Color"
        Me.btmColor.UseVisualStyleBackColor = True
        '
        'PrintDialog1
        '
        Me.PrintDialog1.UseEXDialog = True
        '
        'btnPrint
        '
        Me.btnPrint.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnPrint.Location = New System.Drawing.Point(349, 130)
        Me.btnPrint.Name = "btnPrint"
        Me.btnPrint.Size = New System.Drawing.Size(75, 23)
        Me.btnPrint.TabIndex = 5
        Me.btnPrint.Text = "Imprimir"
        Me.btnPrint.UseVisualStyleBackColor = True
        '
        'btnBrowse
        '
        Me.btnBrowse.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnBrowse.Location = New System.Drawing.Point(349, 159)
        Me.btnBrowse.Name = "btnBrowse"
        Me.btnBrowse.Size = New System.Drawing.Size(75, 23)
        Me.btnBrowse.TabIndex = 6
        Me.btnBrowse.Text = "Carpetas"
        Me.btnBrowse.UseVisualStyleBackColor = True
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(349, 189)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 7
        Me.Button1.Text = "Button1"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'Dialogs
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(444, 261)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.btnBrowse)
        Me.Controls.Add(Me.btnPrint)
        Me.Controls.Add(Me.btmColor)
        Me.Controls.Add(Me.btnFont)
        Me.Controls.Add(Me.bthSave)
        Me.Controls.Add(Me.btnOpen)
        Me.Controls.Add(Me.txtFile)
        Me.Name = "Dialogs"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Diálogos"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents txtFile As TextBox
    Friend WithEvents btnOpen As Button
    Friend WithEvents OpenFileDialog1 As OpenFileDialog
    Friend WithEvents bthSave As Button
    Friend WithEvents SaveFileDialog1 As SaveFileDialog
    Friend WithEvents FontDialog1 As FontDialog
    Friend WithEvents btnFont As Button
    Friend WithEvents ColorDialog1 As ColorDialog
    Friend WithEvents btmColor As Button
    Friend WithEvents PrintDialog1 As PrintDialog
    Friend WithEvents btnPrint As Button
    Friend WithEvents FolderBrowserDialog1 As FolderBrowserDialog
    Friend WithEvents btnBrowse As Button
    Friend WithEvents Button1 As Button
End Class
