Public Class dimension1

    Private Sub dimension1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Rnd()
    End Sub
    Private Sub btnCerrar_Click(sender As Object, e As EventArgs) Handles btnCerrar.Click
        Me.Close()
    End Sub

    '& vbCrLf &
    Private Sub btnMostrar_Click(sender As Object, e As EventArgs) Handles btnMostrar.Click
        Dim tabla(9) As Integer
        Dim texto As String = " "

        For i As Integer = 0 To 9
            tabla(i) = Int(Rnd() * 100)
        Next
        LabelNumeros.Text = String.Empty

        For Each valor In tabla
            LabelNumeros.Text += " " + valor.ToString()
        Next


    End Sub


End Class