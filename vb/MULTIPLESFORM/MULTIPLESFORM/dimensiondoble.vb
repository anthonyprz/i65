Public Class dimensiondoble
    Private Sub dimensiondoble_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Rnd()
    End Sub

    Private Sub btnMostrar_Click(sender As Object, e As EventArgs) Handles btnMostrar.Click
        Dim tabla(9, 9) As Integer

        Dim texto As String = " "

        For i As Integer = 0 To 9
            'tabla(i) = Int(Rnd() * 100)
            For j As Integer = 0 To 9
                tabla(i, j) = Int(Rnd() * 100)
            Next
        Next
        Label1.Text = String.Empty

        For i As Integer = 0 To 9
            For j As Integer = 0 To 9
                Label1.Text &= tabla(i, j) & " "
            Next
            Label1.Text += vbCrLf
        Next


    End Sub
End Class