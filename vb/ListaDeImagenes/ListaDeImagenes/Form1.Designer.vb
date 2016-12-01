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
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.ImageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.btnaleatorio = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.btnvaciar = New System.Windows.Forms.Button()
        Me.btncantidad = New System.Windows.Forms.Button()
        Me.btnelementos = New System.Windows.Forms.Button()
        Me.btnsuma = New System.Windows.Forms.Button()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'ImageList1
        '
        Me.ImageList1.ImageStream = CType(resources.GetObject("ImageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList1.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList1.Images.SetKeyName(0, "01_messages.png")
        Me.ImageList1.Images.SetKeyName(1, "02_calendar.png")
        Me.ImageList1.Images.SetKeyName(2, "03_photos.png")
        Me.ImageList1.Images.SetKeyName(3, "04_maps.png")
        Me.ImageList1.Images.SetKeyName(4, "05_phonebook.png")
        Me.ImageList1.Images.SetKeyName(5, "06_calculator.png")
        Me.ImageList1.Images.SetKeyName(6, "07_note.png")
        Me.ImageList1.Images.SetKeyName(7, "08_settings.png")
        Me.ImageList1.Images.SetKeyName(8, "09.call.png")
        Me.ImageList1.Images.SetKeyName(9, "10.wireless.png")
        '
        'PictureBox1
        '
        Me.PictureBox1.Location = New System.Drawing.Point(286, 12)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(172, 135)
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'btnaleatorio
        '
        Me.btnaleatorio.Location = New System.Drawing.Point(97, 224)
        Me.btnaleatorio.Name = "btnaleatorio"
        Me.btnaleatorio.Size = New System.Drawing.Size(75, 23)
        Me.btnaleatorio.TabIndex = 1
        Me.btnaleatorio.Text = "aleatorio"
        Me.btnaleatorio.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(94, 184)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(39, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Label1"
        '
        'btnvaciar
        '
        Me.btnvaciar.Location = New System.Drawing.Point(205, 224)
        Me.btnvaciar.Name = "btnvaciar"
        Me.btnvaciar.Size = New System.Drawing.Size(75, 23)
        Me.btnvaciar.TabIndex = 3
        Me.btnvaciar.Text = "vaciar"
        Me.btnvaciar.UseVisualStyleBackColor = True
        '
        'btncantidad
        '
        Me.btncantidad.Location = New System.Drawing.Point(309, 223)
        Me.btncantidad.Name = "btncantidad"
        Me.btncantidad.Size = New System.Drawing.Size(104, 23)
        Me.btncantidad.TabIndex = 4
        Me.btncantidad.Text = "mostrar cantidad"
        Me.btncantidad.UseVisualStyleBackColor = True
        '
        'btnelementos
        '
        Me.btnelementos.Location = New System.Drawing.Point(432, 223)
        Me.btnelementos.Name = "btnelementos"
        Me.btnelementos.Size = New System.Drawing.Size(120, 23)
        Me.btnelementos.TabIndex = 5
        Me.btnelementos.Text = "mostrar elementos"
        Me.btnelementos.UseVisualStyleBackColor = True
        '
        'btnsuma
        '
        Me.btnsuma.Location = New System.Drawing.Point(571, 223)
        Me.btnsuma.Name = "btnsuma"
        Me.btnsuma.Size = New System.Drawing.Size(114, 23)
        Me.btnsuma.TabIndex = 6
        Me.btnsuma.Text = "mostrar suma"
        Me.btnsuma.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(804, 296)
        Me.Controls.Add(Me.btnsuma)
        Me.Controls.Add(Me.btnelementos)
        Me.Controls.Add(Me.btncantidad)
        Me.Controls.Add(Me.btnvaciar)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btnaleatorio)
        Me.Controls.Add(Me.PictureBox1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents ImageList1 As ImageList
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents btnaleatorio As Button
    Friend WithEvents Label1 As Label
    Friend WithEvents btnvaciar As Button
    Friend WithEvents btncantidad As Button
    Friend WithEvents btnelementos As Button
    Friend WithEvents btnsuma As Button
End Class
