Public Class Form1
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Label4.Text = ""
        Randomize()
        '  Label1.Text = Int((100 * Rnd()) + 1)
        'MsgBox(Rnd())
        Dim num1, num2, num3 As Integer

        num1 = Int((10 * Rnd()))
        num2 = Int((10 * Rnd()))
        num3 = Int((10 * Rnd()))

        If num1 = num2 And num1 = num3 Then
            Label4.Text = "el label 1, 2 y 3 son iguales"
            MsgBox("el label 1, 2 y 3 son iguales")
        ElseIf num1 = num2 Then
            Label4.Text = "el label 1 y 2 son iguales"
            MsgBox("el label 1 y 2 son iguales")
        ElseIf num1 = num3 Then
            Label4.Text = "el label 1 y 3 son iguales"
            MsgBox("el label 1 y 3 son iguales")
        ElseIf num2 = num3 Then
            Label4.Text = "el label 2 y 3 son iguales"
            MsgBox("el label 2 y 3 son iguales")
        End If



        Label1.Text = num1
        Label2.Text = num2
        Label3.Text = num3
    End Sub
End Class
