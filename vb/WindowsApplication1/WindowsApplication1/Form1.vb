Public Class Form1

    Dim cadena As String = "TRWAGMYFPDXBNJZSQVHLCKE"
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim numerodni As Integer
        Dim letra As String

        If Len(TextBox1.Text) = 8 Then
            numerodni = Integer.Parse(TextBox1.Text)
            Label1.Text = cadena.Chars(numerodni Mod 23)
        ElseIf Len(TextBox1.Text) = 9 Then
            numerodni = Integer.Parse(Microsoft.VisualBasic.Left(TextBox1.Text, 8))
            letra = Microsoft.VisualBasic.Right(TextBox1.Text, 9)

        End If
        'Integer.Parse(TextBox1.Text)




    End Sub
End Class
