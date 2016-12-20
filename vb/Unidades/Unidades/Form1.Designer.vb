<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
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
        Me.btnUnidades = New System.Windows.Forms.Button()
        Me.lstUnidades = New System.Windows.Forms.ListBox()
        Me.txtDirActual = New System.Windows.Forms.TextBox()
        Me.btnMostrar = New System.Windows.Forms.Button()
        Me.lstArchivos = New System.Windows.Forms.ListBox()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.rtfCaja = New System.Windows.Forms.RichTextBox()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnUnidades
        '
        Me.btnUnidades.Location = New System.Drawing.Point(36, 20)
        Me.btnUnidades.Name = "btnUnidades"
        Me.btnUnidades.Size = New System.Drawing.Size(189, 36)
        Me.btnUnidades.TabIndex = 0
        Me.btnUnidades.Text = "Unidades"
        Me.btnUnidades.UseVisualStyleBackColor = True
        '
        'lstUnidades
        '
        Me.lstUnidades.FormattingEnabled = True
        Me.lstUnidades.Location = New System.Drawing.Point(36, 87)
        Me.lstUnidades.Name = "lstUnidades"
        Me.lstUnidades.Size = New System.Drawing.Size(189, 212)
        Me.lstUnidades.TabIndex = 1
        '
        'txtDirActual
        '
        Me.txtDirActual.Location = New System.Drawing.Point(36, 61)
        Me.txtDirActual.Name = "txtDirActual"
        Me.txtDirActual.Size = New System.Drawing.Size(384, 20)
        Me.txtDirActual.TabIndex = 2
        '
        'btnMostrar
        '
        Me.btnMostrar.Location = New System.Drawing.Point(231, 21)
        Me.btnMostrar.Name = "btnMostrar"
        Me.btnMostrar.Size = New System.Drawing.Size(189, 35)
        Me.btnMostrar.TabIndex = 3
        Me.btnMostrar.Text = "Mostrar contenido"
        Me.btnMostrar.UseVisualStyleBackColor = True
        '
        'lstArchivos
        '
        Me.lstArchivos.FormattingEnabled = True
        Me.lstArchivos.Location = New System.Drawing.Point(232, 87)
        Me.lstArchivos.Name = "lstArchivos"
        Me.lstArchivos.Size = New System.Drawing.Size(188, 212)
        Me.lstArchivos.TabIndex = 4
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.rtfCaja)
        Me.GroupBox1.Controls.Add(Me.btnUnidades)
        Me.GroupBox1.Controls.Add(Me.lstArchivos)
        Me.GroupBox1.Controls.Add(Me.btnMostrar)
        Me.GroupBox1.Controls.Add(Me.lstUnidades)
        Me.GroupBox1.Controls.Add(Me.txtDirActual)
        Me.GroupBox1.Location = New System.Drawing.Point(12, 3)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(697, 311)
        Me.GroupBox1.TabIndex = 5
        Me.GroupBox1.TabStop = False
        '
        'rtfCaja
        '
        Me.rtfCaja.Location = New System.Drawing.Point(426, 21)
        Me.rtfCaja.Name = "rtfCaja"
        Me.rtfCaja.Size = New System.Drawing.Size(256, 278)
        Me.rtfCaja.TabIndex = 5
        Me.rtfCaja.Text = ""
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(720, 331)
        Me.Controls.Add(Me.GroupBox1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents btnUnidades As Button
    Friend WithEvents lstUnidades As ListBox
    Friend WithEvents txtDirActual As TextBox
    Friend WithEvents btnMostrar As Button
    Friend WithEvents lstArchivos As ListBox
    Friend WithEvents GroupBox1 As GroupBox
    Friend WithEvents rtfCaja As RichTextBox
End Class
