<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class dimension1
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
        Me.btnCerrar = New System.Windows.Forms.Button()
        Me.btnMostrar = New System.Windows.Forms.Button()
        Me.LabelNumeros = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'btnCerrar
        '
        Me.btnCerrar.Location = New System.Drawing.Point(12, 317)
        Me.btnCerrar.Name = "btnCerrar"
        Me.btnCerrar.Size = New System.Drawing.Size(260, 23)
        Me.btnCerrar.TabIndex = 0
        Me.btnCerrar.Text = "Cerrar"
        Me.btnCerrar.UseVisualStyleBackColor = True
        '
        'btnMostrar
        '
        Me.btnMostrar.Location = New System.Drawing.Point(12, 288)
        Me.btnMostrar.Name = "btnMostrar"
        Me.btnMostrar.Size = New System.Drawing.Size(260, 23)
        Me.btnMostrar.TabIndex = 1
        Me.btnMostrar.Text = "Mostrar Numeros (10)" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10)
        Me.btnMostrar.UseVisualStyleBackColor = True
        '
        'LabelNumeros
        '
        Me.LabelNumeros.AutoSize = True
        Me.LabelNumeros.Location = New System.Drawing.Point(12, 45)
        Me.LabelNumeros.Name = "LabelNumeros"
        Me.LabelNumeros.Size = New System.Drawing.Size(0, 13)
        Me.LabelNumeros.TabIndex = 2
        '
        'dimension1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 352)
        Me.Controls.Add(Me.LabelNumeros)
        Me.Controls.Add(Me.btnMostrar)
        Me.Controls.Add(Me.btnCerrar)
        Me.Name = "dimension1"
        Me.Text = "dimension1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents btnCerrar As Button
    Friend WithEvents btnMostrar As Button
    Friend WithEvents LabelNumeros As Label
End Class
