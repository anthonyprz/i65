Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'BDAnunciosDataSet.anuncio' table. You can move, or remove it, as needed.
        Me.AnuncioTableAdapter.Fill(Me.BDAnunciosDataSet.anuncio)


    End Sub

    Private Sub AnuncioBindingNavigatorSaveItem_Click(sender As Object, e As EventArgs) Handles AnuncioBindingNavigatorSaveItem.Click
        Me.Validate()
        Me.AnuncioBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.BDAnunciosDataSet)

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Form2.Show()
    End Sub
End Class
