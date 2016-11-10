




Public Class Form1
    Private Sub btn_Click(sender As Object, e As EventArgs) Handles btn.Click
        Dim array As Array = {"T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X", "B", "N", "J", "Z", "S", "Q", "V", "H", "L", "C", "K", "E"}

        Dim numerodni As Integer = Integer.Parse(textbox.Text)

        salida.Text = array(numerodni Mod 23)

    End Sub
End Class
