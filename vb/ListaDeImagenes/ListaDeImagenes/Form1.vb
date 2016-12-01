Imports System.Text

Public Class Form1

    Dim imagenesElegidas As New List(Of Integer)
    Dim numero As Integer
    Dim limite As Integer = 10

    Dim s As StringBuilder = New StringBuilder()
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Randomize()
    End Sub

    Private Sub btnaleatorio_Click(sender As Object, e As EventArgs) Handles btnaleatorio.Click
        Dim aleatorio As Integer
        aleatorio = Int(Rnd() * 10)
        While imagenesElegidas.Contains(aleatorio)
            aleatorio = Int(Rnd() * 10)
        End While
        PictureBox1.Image = ImageList1.Images(aleatorio)
        ' Label1.Text = aleatorio
        imagenesElegidas.Add(aleatorio)
        s.AppendLine(aleatorio.ToString + " ")

        If imagenesElegidas.Count = limite Then
            btnaleatorio.Enabled = False
        End If
    End Sub

    Private Sub btnvaciar_Click(sender As Object, e As EventArgs) Handles btnvaciar.Click
        imagenesElegidas.Clear()
        PictureBox1.Image = Nothing

    End Sub

    Private Sub btncantidad_Click(sender As Object, e As EventArgs) Handles btncantidad.Click
        Label1.Text = imagenesElegidas.Count
    End Sub

    Private Sub btnelementos_Click(sender As Object, e As EventArgs) Handles btnelementos.Click
        Label1.Text = s.ToString
    End Sub
End Class
