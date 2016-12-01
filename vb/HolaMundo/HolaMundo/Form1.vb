Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles btnSaludar.Click



        If (texto.Text = "") Then
            lblResultado.Text = "hola puedes escribir algo majo"
        Else
            'enviar texto a etiqueta 
            lblResultado.Text = "hola " & texto.Text
        End If


    End Sub
End Class
