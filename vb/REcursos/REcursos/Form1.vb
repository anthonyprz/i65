Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Label1.Text = My.Resources.ES.msgBienvenido
        ToolStripDropDownButton1.Text = My.Resources.ES.archivo
        NuevoToolStripMenuItem.Text = My.Resources.ES.nuevo
        ConsultarToolStripMenuItem.Text = My.Resources.ES.consultar
        ModificarToolStripMenuItem.Text = My.Resources.ES.modificar
        EliminarToolStripMenuItem.Text = My.Resources.ES.eliminar
        SalirToolStripMenuItem.Text = My.Resources.ES.salir
    End Sub

    Private Sub btnES_Click(sender As Object, e As EventArgs) Handles btnES.Click
        Label1.Text = My.Resources.ES.msgBienvenido
        ToolStripDropDownButton1.Text = My.Resources.ES.archivo
        NuevoToolStripMenuItem.Text = My.Resources.ES.nuevo
        ConsultarToolStripMenuItem.Text = My.Resources.ES.consultar
        ModificarToolStripMenuItem.Text = My.Resources.ES.modificar
        EliminarToolStripMenuItem.Text = My.Resources.ES.eliminar
        SalirToolStripMenuItem.Text = My.Resources.ES.salir
    End Sub

    Private Sub btnEN_Click(sender As Object, e As EventArgs) Handles btnEN.Click
        Label1.Text = My.Resources.EN.msgBienvenido
        ToolStripDropDownButton1.Text = My.Resources.EN.archivo
        NuevoToolStripMenuItem.Text = My.Resources.EN.nuevo
        ConsultarToolStripMenuItem.Text = My.Resources.EN.consultar
        ModificarToolStripMenuItem.Text = My.Resources.EN.modificar
        EliminarToolStripMenuItem.Text = My.Resources.EN.eliminar
        SalirToolStripMenuItem.Text = My.Resources.EN.salir
    End Sub
End Class
