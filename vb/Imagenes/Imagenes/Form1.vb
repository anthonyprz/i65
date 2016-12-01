Public Class Form1
    Dim NumeroImagen As Integer = 0
    Private Sub btnCargaImage_Click(sender As Object, e As EventArgs) Handles btnCargaImage.Click
        'PictureBox1.Image = Image.FromFile("C:\Users\I68\Desktop\Mobile-Icons\01_messages.png")

        PictureBox1.Image = Image.FromFile("images\01_messages.png")
        NumeroImagen = 1

    End Sub

    Private Sub btnCargaImage2_Click(sender As Object, e As EventArgs) Handles btnCargaImage2.Click

        PictureBox1.Image = Image.FromFile("images\02_calendar.png")
        NumeroImagen = 2
    End Sub

    Private Sub btnCargaImage3_Click(sender As Object, e As EventArgs) Handles btnCargaImage3.Click
        NumeroImagen = 0
        PictureBox1.Image = Image.FromFile("images\05_phonebook.png")

    End Sub


    Private Sub siguiente_Click(sender As Object, e As EventArgs) Handles siguiente.Click
        If NumeroImagen = 0 Then
            PictureBox1.Image = Image.FromFile("images\01_messages.png")
            NumeroImagen = NumeroImagen + 1
        ElseIf NumeroImagen = 1 Then
            PictureBox1.Image = Image.FromFile("images\02_calendar.png")
            NumeroImagen = NumeroImagen + 1
        ElseIf NumeroImagen = 2 Then
            PictureBox1.Image = Image.FromFile("images\05_phonebook.png")
            NumeroImagen = 0
        End If

    End Sub


End Class
