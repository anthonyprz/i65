Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Dim cantidad As Integer = TableLayoutPanel1.RowCount * TableLayoutPanel1.ColumnCount
        Dim tablaBotones(cantidad - 1) As Button

        For i As Integer = 0 To cantidad - 1
            tablaBotones(i) = New Button()
            tablaBotones(i).Dock = DockStyle.Fill
            tablaBotones(i).BackColor = Color.MediumPurple
            tablaBotones(i).Text = "♦ " & (i + 1).ToString & " ♦"
            TableLayoutPanel1.Controls.Add(tablaBotones(i))
            AddHandler tablaBotones(i).Click, AddressOf ClickEnBotones
        Next
    End Sub
    Private Sub ClickEnBotones(sender As Object, ByVal e As EventArgs)
        Dim botonNum As Button = sender
        MessageBox.Show("Click " & botonNum.Text)
    End Sub

    'Private Sub Button1_Click(sender As Object, e As EventArgs)
    '    'Dim cuadro As New TextBox()
    '    'cuadro.Text = "Cuadro de texto"
    '    'cuadro.Location = New Point(10, 10)
    '    'cuadro.Size = New Size(100, 50)
    '    'Panel1.Controls.Add(cuadro)
    '    ''cuadro.SetBounds(10, 10, 10, 10)

    'End Sub
End Class
