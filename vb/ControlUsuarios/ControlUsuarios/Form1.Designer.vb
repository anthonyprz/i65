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
        Me.tbxUserName = New System.Windows.Forms.TextBox()
        Me.tbxpass = New System.Windows.Forms.TextBox()
        Me.btnEntrar = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'tbxUserName
        '
        Me.tbxUserName.Location = New System.Drawing.Point(70, 41)
        Me.tbxUserName.Multiline = True
        Me.tbxUserName.Name = "tbxUserName"
        Me.tbxUserName.Size = New System.Drawing.Size(143, 20)
        Me.tbxUserName.TabIndex = 0
        '
        'tbxpass
        '
        Me.tbxpass.Location = New System.Drawing.Point(70, 89)
        Me.tbxpass.Name = "tbxpass"
        Me.tbxpass.PasswordChar = Global.Microsoft.VisualBasic.ChrW(9830)
        Me.tbxpass.Size = New System.Drawing.Size(143, 20)
        Me.tbxpass.TabIndex = 1
        '
        'btnEntrar
        '
        Me.btnEntrar.Location = New System.Drawing.Point(105, 131)
        Me.btnEntrar.Name = "btnEntrar"
        Me.btnEntrar.Size = New System.Drawing.Size(75, 23)
        Me.btnEntrar.TabIndex = 2
        Me.btnEntrar.Text = "Entrar"
        Me.btnEntrar.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(131, 22)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(39, 13)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "Label1"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(286, 302)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnEntrar)
        Me.Controls.Add(Me.tbxpass)
        Me.Controls.Add(Me.tbxUserName)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents tbxUserName As TextBox
    Friend WithEvents tbxpass As TextBox
    Friend WithEvents btnEntrar As Button
    Friend WithEvents Label1 As Label
End Class
