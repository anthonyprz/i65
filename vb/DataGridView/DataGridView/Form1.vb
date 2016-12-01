Public Class Form1




    Private Sub NumericUpDown1_ValueChanged(sender As Object, e As EventArgs) Handles NumericUpDown1.ValueChanged
        rellenar()

    End Sub
    Private Sub NumericUpDown2_ValueChanged(sender As Object, e As EventArgs) Handles NumericUpDown2.ValueChanged
        rellenar()
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Randomize()
        rellenar()



    End Sub
    Private Sub rellenar()
        Dim tabla(,) As Integer
        Dim filas As Integer = NumericUpDown1.Value
        Dim columnas As Integer = NumericUpDown2.Value
        ReDim tabla(filas - 1, columnas - 1)

        For i As Integer = 0 To filas - 1
            For j As Integer = 0 To columnas - 1
                tabla(i, j) = Int(Rnd() * 100) + 1
            Next
        Next

        DataGridView1.RowCount = filas
        DataGridView1.ColumnCount = columnas

        For i As Integer = 0 To filas - 1
            For j As Integer = 0 To columnas - 1
                DataGridView1.Rows(i).Cells(j).Value = tabla(i, j)
            Next
        Next


    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            DataGridView1.ColumnHeadersVisible = True
        Else
            DataGridView1.ColumnHeadersVisible = False
        End If
    End Sub

    Private Sub CheckBox2_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox2.CheckedChanged
        If CheckBox2.Checked = True Then
            DataGridView1.RowHeadersVisible = True
        Else
            DataGridView1.RowHeadersVisible = False
        End If
    End Sub
End Class
