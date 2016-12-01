Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Form2.Show()
        For Each f As Form In Application.OpenForms
            Label1.Text = f.Text
        Next

    End Sub



    Private Sub Button2_Click_1(sender As Object, e As EventArgs) Handles Button2.Click
        Form2.ShowDialog()
    End Sub
    Public nombre As String
    Private Sub establecer_Click(sender As Object, e As EventArgs) Handles establecer.Click
        nombre = TextBox1.Text
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        MessageBox.Show(nombre)
    End Sub
End Class
