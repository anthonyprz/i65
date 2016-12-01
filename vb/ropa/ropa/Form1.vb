Public Class Form1

    Dim talla As String
    Dim color As String

    Private Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton1.CheckedChanged
        talla = RadioButton1.Text
        seleccionado.Text = talla + " " + color

    End Sub

    Private Sub RadioButton2_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton2.CheckedChanged
        talla = RadioButton2.Text
        seleccionado.Text = talla + " " + color
    End Sub

    Private Sub RadioButton3_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton3.CheckedChanged
        talla = RadioButton3.Text
        seleccionado.Text = talla + " " + color
    End Sub

    Private Sub RadioButton4_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton4.CheckedChanged
        talla = RadioButton4.Text
        seleccionado.Text = talla + " " + color
    End Sub

    Private Sub RadioButton8_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton8.CheckedChanged
        color = RadioButton8.Text
        seleccionado.Text = talla + " " + color
    End Sub

    Private Sub RadioButton7_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton7.CheckedChanged
        color = RadioButton7.Text
        seleccionado.Text = talla + " " + color
    End Sub

    Private Sub RadioButton6_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton6.CheckedChanged
        color = RadioButton6.Text
        seleccionado.Text = talla + " " + color
    End Sub

    Private Sub RadioButton5_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton5.CheckedChanged
        color = RadioButton5.Text
        seleccionado.Text = talla + " " + color
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        RadioButton8.Checked = True
        RadioButton1.Checked = True
    End Sub
End Class
