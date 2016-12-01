Public Class Form1

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        PictureBox2.Image = ImageList1.Images(0)

        Randomize()
        For i As Integer = 0 To 9
            tabla(i) = False
        Next

    End Sub
    Dim tabla(9) As Boolean
    Dim cantidad As Integer = 0



    Private Sub btnAle_Click(sender As Object, e As EventArgs) Handles btnAle.Click
        Dim num As Integer
        num = Int(Rnd() * 10)
        While (tabla(num) = True)
            num = Int(Rnd() * 10)
        End While
        tabla(num) = True
        LBLNumero.Text = num
        PictureBox3.Image = ImageList1.Images(num)

        cantidad += 1
        If cantidad = 10 Then
            btnAle.Enabled = False
        End If

    End Sub



    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        PictureBox1.Image = ImageList1.Images(0)
    End Sub
    Dim count As Integer = 0
    Private Sub siguiente_Click(sender As Object, e As EventArgs) Handles siguiente.Click
        count += 1
        PictureBox1.Image = ImageList1.Images(count Mod ImageList1.Images.Count)
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        count += 1
        PictureBox2.Image = ImageList1.Images(count Mod ImageList1.Images.Count)
    End Sub



    Private Sub pausar_Click(sender As Object, e As EventArgs) Handles pausar.Click

        If pausar.Text = "pausar" Then
            Timer1.Enabled = False
            pausar.Text = "reanudar"
        ElseIf pausar.Text = "reanudar" Then
            Timer1.Enabled = True
            pausar.Text = "pausar"
        End If



    End Sub

    Dim inteval
    Private Sub menos_Click(sender As Object, e As EventArgs) Handles menos.Click
        If Timer1.Interval < 110 Then
            Timer1.Interval = 100
        Else
            Timer1.Interval -= 100
        End If
    End Sub
    Private Sub mas_Click(sender As Object, e As EventArgs) Handles mas.Click
        Timer1.Interval += 100
    End Sub





End Class
