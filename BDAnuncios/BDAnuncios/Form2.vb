Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Public Class Form2
    Private Sub Form2_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ConnectToSql()
    End Sub
    ' Visual Basic
    Public Sub ConnectToSql()
        Dim conn As New SqlClient.SqlConnection
        ' TODO: Modify the connection string and include any
        ' additional required properties for your database.
        conn.ConnectionString =
        "integrated security=SSPI;data source=PC24-A311\SQLEXPRESS;" &
        "persist security info=False;initial catalog=BDAnuncios"
        Try

            Dim sql As String = "SELECT * FROM anuncio"
            Dim dataadapter As New SqlDataAdapter(sql, conn)
            Dim ds As New DataSet()
            dataadapter.Fill(ds, "anuncio")
            conn.Open()
            DataGridView1.DataSource = ds
            DataGridView1.DataMember = "anuncio"
            ' Insert code to process data.
            ' MessageBox.Show("se ha conectado a la base de datos")



        Catch ex As Exception
            MessageBox.Show("Failed to connect to data source")
        Finally
            conn.Close()
        End Try
    End Sub
End Class