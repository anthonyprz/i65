<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.btnSaludar = New System.Windows.Forms.Button()
        Me.lblResultado = New System.Windows.Forms.Label()
        Me.texto = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'btnSaludar
        '
        Me.btnSaludar.Location = New System.Drawing.Point(308, 238)
        Me.btnSaludar.Name = "btnSaludar"
        Me.btnSaludar.Size = New System.Drawing.Size(75, 23)
        Me.btnSaludar.TabIndex = 0
        Me.btnSaludar.Text = "Saludar"
        Me.btnSaludar.UseVisualStyleBackColor = True
        '
        'lblResultado
        '
        Me.lblResultado.AutoSize = True
        Me.lblResultado.Location = New System.Drawing.Point(305, 152)
        Me.lblResultado.Name = "lblResultado"
        Me.lblResultado.Size = New System.Drawing.Size(0, 13)
        Me.lblResultado.TabIndex = 2
        '
        'texto
        '
        Me.texto.Location = New System.Drawing.Point(238, 99)
        Me.texto.Name = "texto"
        Me.texto.Size = New System.Drawing.Size(100, 20)
        Me.texto.TabIndex = 3
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(712, 461)
        Me.Controls.Add(Me.texto)
        Me.Controls.Add(Me.lblResultado)
        Me.Controls.Add(Me.btnSaludar)
        Me.Name = "Form1"
        Me.Text = "Formulario"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents btnSaludar As Button
    Friend WithEvents lblResultado As Label
    Friend WithEvents texto As TextBox
End Class
