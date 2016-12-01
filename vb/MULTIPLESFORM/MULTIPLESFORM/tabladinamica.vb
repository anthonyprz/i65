Public Class tabladinamica
    Private Sub tabladinamica_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Rnd()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim tabla() As Integer
        Dim tamano As Integer

        tamano = Int(TextBox1.Text)

        ReDim tabla(tamano - 1)

        For i As Integer = 0 To tamano - 1
            tabla(i) = Int(Rnd() * 100) + 1
        Next
        Label1.Text = String.Empty

        For Each valor As Integer In tabla
            Label1.Text &= valor & " "
        Next

    End Sub
End Class