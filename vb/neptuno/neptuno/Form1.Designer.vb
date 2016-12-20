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
        Me.components = New System.ComponentModel.Container()
        Me.Neptuno2002DataSet = New neptuno.Neptuno2002DataSet()
        Me.Neptuno2002DataSetBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataGridView1 = New System.Windows.Forms.DataGridView()
        Me.IdClienteDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NombreCompañíaDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NombreContactoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CargoContactoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DirecciónDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CiudadDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.RegiónDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CódPostalDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PaísDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TeléfonoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FaxDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ClientesBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.ClientesTableAdapter = New neptuno.Neptuno2002DataSetTableAdapters.ClientesTableAdapter()
        Me.SplitContainer1 = New System.Windows.Forms.SplitContainer()
        Me.btnBorrar = New System.Windows.Forms.Button()
        Me.TextBox2 = New System.Windows.Forms.TextBox()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.btnClientesCiudad = New System.Windows.Forms.Button()
        Me.TextBox3 = New System.Windows.Forms.TextBox()
        CType(Me.Neptuno2002DataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Neptuno2002DataSetBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ClientesBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer1.Panel1.SuspendLayout()
        Me.SplitContainer1.Panel2.SuspendLayout()
        Me.SplitContainer1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Neptuno2002DataSet
        '
        Me.Neptuno2002DataSet.DataSetName = "Neptuno2002DataSet"
        Me.Neptuno2002DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Neptuno2002DataSetBindingSource
        '
        Me.Neptuno2002DataSetBindingSource.DataSource = Me.Neptuno2002DataSet
        Me.Neptuno2002DataSetBindingSource.Position = 0
        '
        'DataGridView1
        '
        Me.DataGridView1.AutoGenerateColumns = False
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.IdClienteDataGridViewTextBoxColumn, Me.NombreCompañíaDataGridViewTextBoxColumn, Me.NombreContactoDataGridViewTextBoxColumn, Me.CargoContactoDataGridViewTextBoxColumn, Me.DirecciónDataGridViewTextBoxColumn, Me.CiudadDataGridViewTextBoxColumn, Me.RegiónDataGridViewTextBoxColumn, Me.CódPostalDataGridViewTextBoxColumn, Me.PaísDataGridViewTextBoxColumn, Me.TeléfonoDataGridViewTextBoxColumn, Me.FaxDataGridViewTextBoxColumn})
        Me.DataGridView1.DataSource = Me.ClientesBindingSource
        Me.DataGridView1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.DataGridView1.Location = New System.Drawing.Point(0, 0)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.Size = New System.Drawing.Size(704, 153)
        Me.DataGridView1.TabIndex = 0
        '
        'IdClienteDataGridViewTextBoxColumn
        '
        Me.IdClienteDataGridViewTextBoxColumn.DataPropertyName = "IdCliente"
        Me.IdClienteDataGridViewTextBoxColumn.HeaderText = "IdCliente"
        Me.IdClienteDataGridViewTextBoxColumn.Name = "IdClienteDataGridViewTextBoxColumn"
        '
        'NombreCompañíaDataGridViewTextBoxColumn
        '
        Me.NombreCompañíaDataGridViewTextBoxColumn.DataPropertyName = "NombreCompañía"
        Me.NombreCompañíaDataGridViewTextBoxColumn.HeaderText = "NombreCompañía"
        Me.NombreCompañíaDataGridViewTextBoxColumn.Name = "NombreCompañíaDataGridViewTextBoxColumn"
        '
        'NombreContactoDataGridViewTextBoxColumn
        '
        Me.NombreContactoDataGridViewTextBoxColumn.DataPropertyName = "NombreContacto"
        Me.NombreContactoDataGridViewTextBoxColumn.HeaderText = "NombreContacto"
        Me.NombreContactoDataGridViewTextBoxColumn.Name = "NombreContactoDataGridViewTextBoxColumn"
        '
        'CargoContactoDataGridViewTextBoxColumn
        '
        Me.CargoContactoDataGridViewTextBoxColumn.DataPropertyName = "CargoContacto"
        Me.CargoContactoDataGridViewTextBoxColumn.HeaderText = "CargoContacto"
        Me.CargoContactoDataGridViewTextBoxColumn.Name = "CargoContactoDataGridViewTextBoxColumn"
        '
        'DirecciónDataGridViewTextBoxColumn
        '
        Me.DirecciónDataGridViewTextBoxColumn.DataPropertyName = "Dirección"
        Me.DirecciónDataGridViewTextBoxColumn.HeaderText = "Dirección"
        Me.DirecciónDataGridViewTextBoxColumn.Name = "DirecciónDataGridViewTextBoxColumn"
        '
        'CiudadDataGridViewTextBoxColumn
        '
        Me.CiudadDataGridViewTextBoxColumn.DataPropertyName = "Ciudad"
        Me.CiudadDataGridViewTextBoxColumn.HeaderText = "Ciudad"
        Me.CiudadDataGridViewTextBoxColumn.Name = "CiudadDataGridViewTextBoxColumn"
        '
        'RegiónDataGridViewTextBoxColumn
        '
        Me.RegiónDataGridViewTextBoxColumn.DataPropertyName = "Región"
        Me.RegiónDataGridViewTextBoxColumn.HeaderText = "Región"
        Me.RegiónDataGridViewTextBoxColumn.Name = "RegiónDataGridViewTextBoxColumn"
        '
        'CódPostalDataGridViewTextBoxColumn
        '
        Me.CódPostalDataGridViewTextBoxColumn.DataPropertyName = "CódPostal"
        Me.CódPostalDataGridViewTextBoxColumn.HeaderText = "CódPostal"
        Me.CódPostalDataGridViewTextBoxColumn.Name = "CódPostalDataGridViewTextBoxColumn"
        '
        'PaísDataGridViewTextBoxColumn
        '
        Me.PaísDataGridViewTextBoxColumn.DataPropertyName = "País"
        Me.PaísDataGridViewTextBoxColumn.HeaderText = "País"
        Me.PaísDataGridViewTextBoxColumn.Name = "PaísDataGridViewTextBoxColumn"
        '
        'TeléfonoDataGridViewTextBoxColumn
        '
        Me.TeléfonoDataGridViewTextBoxColumn.DataPropertyName = "Teléfono"
        Me.TeléfonoDataGridViewTextBoxColumn.HeaderText = "Teléfono"
        Me.TeléfonoDataGridViewTextBoxColumn.Name = "TeléfonoDataGridViewTextBoxColumn"
        '
        'FaxDataGridViewTextBoxColumn
        '
        Me.FaxDataGridViewTextBoxColumn.DataPropertyName = "Fax"
        Me.FaxDataGridViewTextBoxColumn.HeaderText = "Fax"
        Me.FaxDataGridViewTextBoxColumn.Name = "FaxDataGridViewTextBoxColumn"
        '
        'ClientesBindingSource
        '
        Me.ClientesBindingSource.DataMember = "Clientes"
        Me.ClientesBindingSource.DataSource = Me.Neptuno2002DataSetBindingSource
        '
        'ClientesTableAdapter
        '
        Me.ClientesTableAdapter.ClearBeforeFill = True
        '
        'SplitContainer1
        '
        Me.SplitContainer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer1.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer1.Name = "SplitContainer1"
        Me.SplitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal
        '
        'SplitContainer1.Panel1
        '
        Me.SplitContainer1.Panel1.Controls.Add(Me.TextBox3)
        Me.SplitContainer1.Panel1.Controls.Add(Me.btnClientesCiudad)
        Me.SplitContainer1.Panel1.Controls.Add(Me.btnBorrar)
        Me.SplitContainer1.Panel1.Controls.Add(Me.TextBox2)
        Me.SplitContainer1.Panel1.Controls.Add(Me.TextBox1)
        '
        'SplitContainer1.Panel2
        '
        Me.SplitContainer1.Panel2.Controls.Add(Me.DataGridView1)
        Me.SplitContainer1.Size = New System.Drawing.Size(704, 314)
        Me.SplitContainer1.SplitterDistance = 157
        Me.SplitContainer1.TabIndex = 1
        '
        'btnBorrar
        '
        Me.btnBorrar.Location = New System.Drawing.Point(298, 12)
        Me.btnBorrar.Name = "btnBorrar"
        Me.btnBorrar.Size = New System.Drawing.Size(96, 63)
        Me.btnBorrar.TabIndex = 2
        Me.btnBorrar.Text = "Borrar"
        Me.btnBorrar.UseVisualStyleBackColor = True
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(28, 55)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(244, 20)
        Me.TextBox2.TabIndex = 1
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(28, 12)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(244, 20)
        Me.TextBox1.TabIndex = 0
        '
        'btnClientesCiudad
        '
        Me.btnClientesCiudad.Location = New System.Drawing.Point(423, 37)
        Me.btnClientesCiudad.Name = "btnClientesCiudad"
        Me.btnClientesCiudad.Size = New System.Drawing.Size(101, 23)
        Me.btnClientesCiudad.TabIndex = 3
        Me.btnClientesCiudad.Text = " Clientes por ciudad"
        Me.btnClientesCiudad.UseVisualStyleBackColor = True
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(423, 11)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(100, 20)
        Me.TextBox3.TabIndex = 4
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(704, 314)
        Me.Controls.Add(Me.SplitContainer1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.Neptuno2002DataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Neptuno2002DataSetBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ClientesBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.Panel1.ResumeLayout(False)
        Me.SplitContainer1.Panel1.PerformLayout()
        Me.SplitContainer1.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents Neptuno2002DataSet As Neptuno2002DataSet
    Friend WithEvents Neptuno2002DataSetBindingSource As BindingSource
    Friend WithEvents DataGridView1 As DataGridView
    Friend WithEvents ClientesBindingSource As BindingSource
    Friend WithEvents ClientesTableAdapter As Neptuno2002DataSetTableAdapters.ClientesTableAdapter
    Friend WithEvents IdClienteDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents NombreCompañíaDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents NombreContactoDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents CargoContactoDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents DirecciónDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents CiudadDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents RegiónDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents CódPostalDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents PaísDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents TeléfonoDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents FaxDataGridViewTextBoxColumn As DataGridViewTextBoxColumn
    Friend WithEvents SplitContainer1 As SplitContainer
    Friend WithEvents TextBox2 As TextBox
    Friend WithEvents TextBox1 As TextBox
    Friend WithEvents btnBorrar As Button
    Friend WithEvents btnClientesCiudad As Button
    Friend WithEvents TextBox3 As TextBox
End Class
