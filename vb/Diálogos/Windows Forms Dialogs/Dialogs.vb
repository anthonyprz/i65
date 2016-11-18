Imports System.Drawing.Printing
Public Class Dialogs
    'Declaración de variables
    Private strFileName As String

    Private strPrintRecord As String

    Private WithEvents DialogsPrintDocument As PrintDocument

    Private Sub btnOpen_Click(sender As Object,
    e As EventArgs) Handles btnOpen.Click
        'Establecer propiedades del diálog OpenFileDialog
        OpenFileDialog1.Filter = "Documentos de texto 
            (*.txt)|*.txt|Todos los archivos (*.*)|*.*"
        OpenFileDialog1.FilterIndex = 1
        OpenFileDialog1.Title = "Ejemplo de Open File Dialog"

        'Mostrar diálogo OpenFileDialog y verificar que se carga el archivo
        If OpenFileDialog1.ShowDialog =
       Windows.Forms.DialogResult.OK Then
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

    Private Sub bthSave_Click(sender As Object, e As EventArgs) Handles bthSave.Click
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
        If SaveFileDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
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

    Private Sub btnFont_Click(sender As Object,
        e As EventArgs) Handles btnFont.Click

        'Establecer las propiedades del diálogo de fuentes FontDialog
        FontDialog1.ShowColor = True

        'Mostrar el Font Dialog, y si el usuario pulsa Aceptar, actualizar la fuente y color de la caja de texto
        If FontDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
            txtFile.Font = FontDialog1.Font
            txtFile.ForeColor = FontDialog1.Color
        End If
    End Sub

    Private Sub btmColor_Click(sender As Object, e As EventArgs) Handles btmColor.Click
        'Mostrar el diálogo de color Color Dialog, y si el usuario pulsa Aceptar actualizar el color de fondo del formulario

        If ColorDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
            Me.BackColor = ColorDialog1.Color
        End If

    End Sub

    Private Sub DialogsPrintDocument_PrintPage(sender As Object,
        e As PrintPageEventArgs) Handles DialogsPrintDocument.PrintPage
        'Declaración de variables
        Dim intCharactersToPrint As Integer
        Dim intLinesPerPage As Integer
        Dim strPrintData As String
        Dim objStringFormat As New StringFormat
        Dim objPrintFont As New Font("Arial", 10)
        Dim objPageBoundaries As RectangleF
        Dim objPrintArea As SizeF

        'Establecer márgenes
        objPageBoundaries = New RectangleF(e.MarginBounds.Left,
            e.MarginBounds.Top, e.MarginBounds.Width,
            e.MarginBounds.Height)

        'Obtener el área de escritura basado en los márgenes y fuente usada
        objPrintArea = New SizeF(e.MarginBounds.Width,
            e.MarginBounds.Height - objPrintFont.GetHeight(e.Graphics))

        'Romper palabras entre líneas
        objStringFormat.Trimming = StringTrimming.Word

        'Obtener el número de caracters a imprimir
        e.Graphics.MeasureString(strPrintRecord, objPrintFont, objPrintArea,
            objStringFormat, intCharactersToPrint, intLinesPerPage)

        'Obtener los datos a imprimir
        strPrintData = strPrintRecord.Substring(0, intCharactersToPrint)

        'Imprimir la página
        e.Graphics.DrawString(strPrintData, objPrintFont, Brushes.Black,
         objPageBoundaries, objStringFormat)
        'Si hay más líneas, imprimir otra página
        If intCharactersToPrint < strPrintRecord.Length Then
            'Borrar el texto impreso del registro de impresión
            strPrintRecord = strPrintRecord.Remove(0, intCharactersToPrint)
            e.HasMorePages = True
        Else
            e.HasMorePages = False
        End If
    End Sub

    Private Sub btnPrint_Click(sender As Object,
    e As EventArgs) Handles btnPrint.Click
        'Instanciar una nueva instancia de PrintDocument
        DialogsPrintDocument = New PrintDocument

        'Establecer las propiedasdesdes de PrintDialog
        With PrintDialog1
            .AllowCurrentPage = False
            .AllowPrintToFile = False
            .AllowSelection = False
            .AllowSomePages = False
            .Document = DialogsPrintDocument
            .PrinterSettings.DefaultPageSettings.Margins.Top = 25
            .PrinterSettings.DefaultPageSettings.Margins.Bottom = 25
            .PrinterSettings.DefaultPageSettings.Margins.Left = 25
            .PrinterSettings.DefaultPageSettings.Margins.Right = 25

        End With

        If PrintDialog1.ShowDialog = DialogResult.OK Then
            'Establecer la impresora seleccionada
            DialogsPrintDocument.PrinterSettings =
            PrintDialog1.PrinterSettings

            'Obtener texto a imprimir
            strPrintRecord = txtFile.Text

            'Invocar al método de impresión Print de PrintDocument
            DialogsPrintDocument.Print()
        End If
    End Sub

    Private Sub btnBrowse_Click(sender As Object,
             e As EventArgs) Handles btnBrowse.Click
        'Establecer propiedades del diálogo de selección de carpeta FolderBrowser
        With FolderBrowserDialog1
            .Description = "Seleccione una carpeta"
            .RootFolder = Environment.SpecialFolder.MyComputer
            .ShowNewFolderButton = False

        End With

        'Mostrar el diálogo FolderBrowser y si el usuario pulsa Aceptar mostrar la carpeta seleccionada
        If FolderBrowserDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
            txtFile.Text = FolderBrowserDialog1.SelectedPath
        End If
    End Sub

End Class
