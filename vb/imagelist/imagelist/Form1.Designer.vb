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
        Me.Button1 = New System.Windows.Forms.Button()
        Me.siguiente = New System.Windows.Forms.Button()
        Me.PictureBox2 = New System.Windows.Forms.PictureBox()
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.pausar = New System.Windows.Forms.Button()
        Me.mas = New System.Windows.Forms.Button()
        Me.menos = New System.Windows.Forms.Button()
        Me.LBLNumero = New System.Windows.Forms.Label()
        Me.btnAle = New System.Windows.Forms.Button()
        Me.ImageList2 = New System.Windows.Forms.ImageList(Me.components)
        Me.PictureBox3 = New System.Windows.Forms.PictureBox()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PictureBox3, System.ComponentModel.ISupportInitialize).BeginInit()
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
        Me.PictureBox1.Location = New System.Drawing.Point(112, 12)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(169, 123)
        Me.PictureBox1.TabIndex = 0
        Me.PictureBox1.TabStop = False
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(12, 12)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 23)
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "primera imagen"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'siguiente
        '
        Me.siguiente.Location = New System.Drawing.Point(12, 45)
        Me.siguiente.Name = "siguiente"
        Me.siguiente.Size = New System.Drawing.Size(75, 23)
        Me.siguiente.TabIndex = 2
        Me.siguiente.Text = "NEXT"
        Me.siguiente.UseVisualStyleBackColor = True
        '
        'PictureBox2
        '
        Me.PictureBox2.Location = New System.Drawing.Point(112, 152)
        Me.PictureBox2.Name = "PictureBox2"
        Me.PictureBox2.Size = New System.Drawing.Size(169, 110)
        Me.PictureBox2.TabIndex = 3
        Me.PictureBox2.TabStop = False
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = 1000
        '
        'pausar
        '
        Me.pausar.Location = New System.Drawing.Point(12, 112)
        Me.pausar.Name = "pausar"
        Me.pausar.Size = New System.Drawing.Size(75, 23)
        Me.pausar.TabIndex = 4
        Me.pausar.Text = "pausar"
        Me.pausar.UseVisualStyleBackColor = True
        '
        'mas
        '
        Me.mas.Location = New System.Drawing.Point(12, 167)
        Me.mas.Name = "mas"
        Me.mas.Size = New System.Drawing.Size(75, 23)
        Me.mas.TabIndex = 5
        Me.mas.Text = "+"
        Me.mas.UseVisualStyleBackColor = True
        '
        'menos
        '
        Me.menos.Location = New System.Drawing.Point(12, 141)
        Me.menos.Name = "menos"
        Me.menos.Size = New System.Drawing.Size(75, 23)
        Me.menos.TabIndex = 6
        Me.menos.Text = "-"
        Me.menos.UseVisualStyleBackColor = True
        '
        'LBLNumero
        '
        Me.LBLNumero.AutoSize = True
        Me.LBLNumero.Location = New System.Drawing.Point(376, 196)
        Me.LBLNumero.Name = "LBLNumero"
        Me.LBLNumero.Size = New System.Drawing.Size(0, 13)
        Me.LBLNumero.TabIndex = 7
        '
        'btnAle
        '
        Me.btnAle.Location = New System.Drawing.Point(323, 239)
        Me.btnAle.Name = "btnAle"
        Me.btnAle.Size = New System.Drawing.Size(131, 23)
        Me.btnAle.TabIndex = 8
        Me.btnAle.Text = "numero aleatorio"
        Me.btnAle.UseVisualStyleBackColor = True
        '
        'ImageList2
        '
        Me.ImageList2.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.ImageList2.ImageSize = New System.Drawing.Size(16, 16)
        Me.ImageList2.TransparentColor = System.Drawing.Color.Transparent
        '
        'PictureBox3
        '
        Me.PictureBox3.Location = New System.Drawing.Point(436, 45)
        Me.PictureBox3.Name = "PictureBox3"
        Me.PictureBox3.Size = New System.Drawing.Size(172, 135)
        Me.PictureBox3.TabIndex = 9
        Me.PictureBox3.TabStop = False
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(789, 378)
        Me.Controls.Add(Me.PictureBox3)
        Me.Controls.Add(Me.btnAle)
        Me.Controls.Add(Me.LBLNumero)
        Me.Controls.Add(Me.menos)
        Me.Controls.Add(Me.mas)
        Me.Controls.Add(Me.pausar)
        Me.Controls.Add(Me.PictureBox2)
        Me.Controls.Add(Me.siguiente)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.PictureBox1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PictureBox3, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents ImageList1 As System.Windows.Forms.ImageList
    Friend WithEvents PictureBox1 As PictureBox
    Friend WithEvents Button1 As Button
    Friend WithEvents siguiente As Button
    Friend WithEvents PictureBox2 As PictureBox
    Friend WithEvents Timer1 As Timer
    Friend WithEvents pausar As Button
    Friend WithEvents mas As Button
    Friend WithEvents menos As Button
    Friend WithEvents LBLNumero As Label
    Friend WithEvents btnAle As Button
    Friend WithEvents ImageList2 As System.Windows.Forms.ImageList
    Friend WithEvents PictureBox3 As PictureBox
End Class
