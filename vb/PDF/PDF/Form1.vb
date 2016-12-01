Public Class Form1

    Private strFileName As String
    Private Sub AbrirToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AbrirToolStripMenuItem.Click

        OpenFileDialog1.ShowDialog()
        AxAcroPDF1.src = OpenFileDialog1.FileName

    End Sub
End Class
