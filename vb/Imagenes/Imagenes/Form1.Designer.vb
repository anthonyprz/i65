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
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.btnCargaImage = New System.Windows.Forms.Button()
        Me.btnCargaImage2 = New System.Windows.Forms.Button()
        Me.btnCargaImage3 = New System.Windows.Forms.Button()
        Me.siguiente = New System.Windows.Forms.Button()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'PictureBox1
        '
        Me.PictureBox1.Location = New System.Drawing.Point(10, 167)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(124, 132)
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'btnCargaImage
        '
        Me.btnCargaImage.Location = New System.Drawing.Point(12, 29)
        Me.btnCargaImage.Name = "btnCargaImage"
        Me.btnCargaImage.Size = New System.Drawing.Size(122, 40)
        Me.btnCargaImage.TabIndex = 1
        Me.btnCargaImage.Text = "Cargar Imagen"
        Me.btnCargaImage.UseVisualStyleBackColor = True
        '
        'btnCargaImage2
        '
        Me.btnCargaImage2.Location = New System.Drawing.Point(12, 75)
        Me.btnCargaImage2.Name = "btnCargaImage2"
        Me.btnCargaImage2.Size = New System.Drawing.Size(122, 40)
        Me.btnCargaImage2.TabIndex = 2
        Me.btnCargaImage2.Text = "Cargar Imagen 2"
        Me.btnCargaImage2.UseVisualStyleBackColor = True
        '
        'btnCargaImage3
        '
        Me.btnCargaImage3.Location = New System.Drawing.Point(10, 121)
        Me.btnCargaImage3.Name = "btnCargaImage3"
        Me.btnCargaImage3.Size = New System.Drawing.Size(124, 40)
        Me.btnCargaImage3.TabIndex = 3
        Me.btnCargaImage3.Text = "Cargar Imagen 3"
        Me.btnCargaImage3.UseVisualStyleBackColor = True
        '
        'siguiente
        '
        Me.siguiente.Location = New System.Drawing.Point(65, 305)
        Me.siguiente.Name = "siguiente"
        Me.siguiente.Size = New System.Drawing.Size(75, 23)
        Me.siguiente.TabIndex = 4
        Me.siguiente.Text = "→"
        Me.siguiente.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(797, 345)
        Me.Controls.Add(Me.siguiente)
        Me.Controls.Add(Me.btnCargaImage3)
        Me.Controls.Add(Me.btnCargaImage2)
        Me.Controls.Add(Me.btnCargaImage)
        Me.Controls.Add(Me.PictureBox1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents btnCargaImage As Button
    Friend WithEvents btnCargaImage2 As Button
    Friend WithEvents btnCargaImage3 As Button
    Friend WithEvents siguiente As Button
End Class
