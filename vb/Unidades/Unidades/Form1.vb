Imports System.IO
Public Class Form1
    Private Sub btnUnidades_Click(sender As Object, e As EventArgs) Handles btnUnidades.Click
        Dim unidades() As DriveInfo
        unidades = IO.DriveInfo.GetDrives

        'limpiar lstUnidades
        lstUnidades.Items.Clear()

        'añadir unidades a lstUnidades
        For i As Integer = 0 To unidades.Count - 1
            lstUnidades.Items.Add(unidades(i).ToString)
        Next
    End Sub

    Private Sub lstUnidades_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstUnidades.SelectedIndexChanged
        txtDirActual.Text = lstUnidades.SelectedItem.ToString

    End Sub

    Private Sub btnMostrar_Click(sender As Object, e As EventArgs) Handles btnMostrar.Click
        Dim dir() As String
        Dim archivos() As String

        dir = IO.Directory.GetDirectories(txtDirActual.Text)
        ' archivos = IO.Directory.GetFiles(txtDirActual.Text)
        archivos = IO.Directory.GetFiles(txtDirActual.Text, "*.rtf")
        lstUnidades.Items.Clear()
        lstArchivos.Items.Clear()

        For i As Integer = 0 To dir.Count - 1
            lstUnidades.Items.Add(dir(i).ToString)
        Next

        For i As Integer = 0 To archivos.Count - 1
            lstArchivos.Items.Add(archivos(i).ToString)
        Next
    End Sub

    Private Sub lstArchivos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstArchivos.SelectedIndexChanged
        rtfCaja.LoadFile(lstUnidades.SelectedItem.ToString)
    End Sub
End Class
