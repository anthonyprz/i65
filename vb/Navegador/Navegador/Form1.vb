Public Class Form1
    Dim paginaAnterior As String
    Dim paginaSiguiente As String
    Dim prueba As Object


    Private Sub WebBrowser1_DocumentCompleted(sender As Object, e As WebBrowserDocumentCompletedEventArgs) Handles WebBrowser1.DocumentCompleted
        'prueba = WebBrowser1.Url.ToString
        paginaAnterior = WebBrowser1.Url.OriginalString

    End Sub


    Private Sub ToolStripAtras_Click(sender As Object, e As EventArgs) Handles ToolStripAtras.Click

        WebBrowser1.Navigate(paginaAnterior.ToString)
    End Sub

    Private Sub ToolStripAdelante_Click(sender As Object, e As EventArgs) Handles ToolStripAdelante.Click

    End Sub

    Private Sub ToolStripHome_Click(sender As Object, e As EventArgs) Handles ToolStripHome.Click
        WebBrowser1.GoHome()
    End Sub

    Private Sub ToolStripTextBox1_KeyDown(sender As Object, e As KeyEventArgs) Handles ToolStripTextBox1.KeyDown
        If e.KeyCode = Keys.Enter Then
            WebBrowser1.Navigate(ToolStripTextBox1.Text)
        End If
    End Sub


End Class
