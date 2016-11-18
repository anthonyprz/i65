Imports System.Drawing.Printing


Public Class Form1

    Private strFileName As String
    Private strPrintRecord As String
    Private WithEvents DialogsPrintDocument As PrintDocument

    Private Sub btnNuevo_Click(sender As Object, e As EventArgs) Handles btnNuevo.Click

    End Sub

    Private Sub btnAbrir_Click(sender As Object, e As EventArgs) Handles btnAbrir.Click
        'Establecer propiedades del diálog OpenFileDialog
        OpenFileDialog1.Filter = "Documentos de texto 
            (*.txt)|*.txt|Todos los archivos (*.*)|*.*"
        OpenFileDialog1.FilterIndex = 1
        OpenFileDialog1.Title = "Ejemplo de Open File Dialog"

        'Mostrar diálogo OpenFileDialog y verificar que se carga el archivo
        If OpenFileDialog1.ShowDialog = DialogResult.OK Then
            Try
                'Guardar la ruta y nombre del archivo seleccionado
                strFileName = OpenFileDialog1.FileName

                Dim fileContents As String
                fileContents = My.Computer.FileSystem.ReadAllText(strFileName)

                'Mostrar todo el contenido del archivo de texto
                txtFile.Text = fileContents

            Catch ex As Exception
                MessageBox.Show(ex.Message,
            My.Application.Info.Title,
            MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub

    Private Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click

    End Sub

    Private Sub btnGuardarcomo_Click(sender As Object, e As EventArgs) Handles btnGuardarcomo.Click

    End Sub

    Private Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click

    End Sub
End Class
