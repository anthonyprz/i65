Imports System.Drawing.Printing


Public Class Form1

    Private strFileName As String
    Private strPrintRecord As String
    Private rutadelfichero As String
    Private WithEvents DialogsPrintDocument As PrintDocument

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        txtFile.ReadOnly = True
        txtFile.BackColor = Color.DarkGray
    End Sub

    Private Sub btnNuevo_Click(sender As Object, e As EventArgs) Handles btnNuevo.Click
        txtFile.ReadOnly = False
        txtFile.BackColor = Color.White
        If txtFile.Text <> "" Then
            guardar()
        End If

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
                '  rutadelfichero = OpenFileDialog1.Filter

                'Mostrar todo el contenido del archivo de texto
                txtFile.Text = fileContents

            Catch ex As Exception
                MessageBox.Show(ex.Message,
            My.Application.Info.Title,
            MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub

    Private Sub guardar()
        'si la ruta esta vacia preguntar
        If strFileName = "" Then
            SaveFileDialog1.Filter = "Documentos de texto 
                (*.txt)|*.txt|Todos los archivos (*.*)|*.*"
            SaveFileDialog1.DefaultExt = "txt"
            SaveFileDialog1.FilterIndex = 1
            SaveFileDialog1.Title = "Ejemplo de Open File Dialog"
            If SaveFileDialog1.ShowDialog = DialogResult.OK Then
                Try
                    'Guardar en una variable la ruta y el nombre del archivo
                    strFileName = SaveFileDialog1.FileName
                    'Realizar el guardado del archivo
                    My.Computer.FileSystem.WriteAllText(strFileName, txtFile.Text, False)
                Catch ex As Exception

                    MessageBox.Show(ex.Message, My.Application.Info.Title,
                MessageBoxButtons.OK, MessageBoxIcon.Error)
                End Try
                'si la ruta no esta vacia no preguntar
            End If


        Else
            With SaveFileDialog1
                .DefaultExt = "txt"
                .FileName = strFileName
                .Filter = "Documentos de texto (*.txt)|*.txt|Todos los archivos (*.*)|*.*"
                .FilterIndex = 1
                .OverwritePrompt = True
                .Title = "Ejemplo de Save File Dialog"

            End With
            Try
                'Guardar en una variable la ruta y el nombre del archivo
                strFileName = SaveFileDialog1.FileName
                'Realizar el guardado del archivo
                My.Computer.FileSystem.WriteAllText(strFileName, txtFile.Text, False)
            Catch ex As Exception

                MessageBox.Show(ex.Message, My.Application.Info.Title,
                MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If



    End Sub
    Private Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        guardar()

    End Sub

    Private Sub btnGuardarcomo_Click(sender As Object, e As EventArgs) Handles btnGuardarcomo.Click
        'Establecer propiedades para el diálogo de guardar archivo SaveFileDialog
        With SaveFileDialog1
            .DefaultExt = "txt"
            .FileName = strFileName
            .Filter = "Documentos de texto (*.txt)|*.txt|Todos los archivos (*.*)|*.*"
            .FilterIndex = 1
            .OverwritePrompt = True
            .Title = "Ejemplo de Save File Dialog"

        End With

        'Mostrar el diálogo de guardar, y si el usuario pulsa el botón de guardar, guardar el archivo
        If SaveFileDialog1.ShowDialog = DialogResult.OK Then
            Try
                'Guardar en una variable la ruta y el nombre del archivo
                strFileName = SaveFileDialog1.FileName
                'Realizar el guardado del archivo
                My.Computer.FileSystem.WriteAllText(strFileName, txtFile.Text, False)
            Catch ex As Exception

                MessageBox.Show(ex.Message, My.Application.Info.Title,
                MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If
    End Sub

    Private Sub btnSalir_Click(sender As Object, e As EventArgs) Handles btnSalir.Click

    End Sub


End Class
