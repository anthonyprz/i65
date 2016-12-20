Imports System
Imports System.Security.Cryptography
Imports System.Text
Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub btnEntrar_Click(sender As Object, e As EventArgs) Handles btnEntrar.Click
        Dim pass = GetHash(tbxUserName.Text)


        If (tbxUserName.Text = "admin") And (tbxpass.Text = "123") Then

                Me.Hide()
                Form2.Show()

            Else

            End If
    End Sub

End Class
