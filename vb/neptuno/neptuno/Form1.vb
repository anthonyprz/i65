Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'Neptuno2002DataSet.Clientes' table. You can move, or remove it, as needed.
        Me.ClientesTableAdapter.Fill(Me.Neptuno2002DataSet.Clientes)

    End Sub

    Private Sub DataGridView1_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        Dim celda As String = DataGridView1.Rows(e.RowIndex).Cells(e.ColumnIndex).Value.ToString
        Dim cliente As String = DataGridView1.Rows(e.RowIndex).Cells(1).Value.ToString
        '   MsgBox(celda)
        '  MsgBox(cliente)

        TextBox1.Text = celda
        TextBox2.Text = cliente
    End Sub

    Private Sub btnBorrar_Click(sender As Object, e As EventArgs) Handles btnBorrar.Click
        If DataGridView1.SelectedRows.Count > 0 Then



            DataGridView1.Rows.Remove(DataGridView1.SelectedRows(0))


        Else
            MessageBox.Show("Select 1 row before you hit Delete")
        End If
    End Sub

    Private Sub btnClientesCiudad_Click(sender As Object, e As EventArgs) Handles btnClientesCiudad.Click

        Dim vista As DataView = New DataView(Me.Neptuno2002DataSet.Tables("clientes"))
        Dim ciudad As String = TextBox3.Text


        vista.RowFilter = "ciudad='" + ciudad + "'"
        vista.Sort = "IdCliente DESC"
        DataGridView1.DataSource = vista



    End Sub
End Class
