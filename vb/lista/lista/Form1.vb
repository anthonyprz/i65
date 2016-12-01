Public Class Form1
    Private Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        ListBox1.Items.Add(TextBox1.Text)
    End Sub
    Private Sub btndelete_Click(sender As Object, e As EventArgs) Handles btndelete.Click


        ' ListBox1.Items.RemoveAt(ListBox1.SelectedIndex)
        'ListBox1.Items.Remove(ListBox1.SelectedItem)

        ' If ListBox1.SelectedItems.Count > 0 Then
        For i As Integer = 0 To ListBox1.SelectedItems.Count - 1
                ListBox1.Items.RemoveAt(ListBox1.SelectedIndex)
            Next
        'End If


    End Sub

    Private Sub btndeleteALL_Click(sender As Object, e As EventArgs) Handles btndeleteALL.Click
        ListBox1.Items.Clear()
    End Sub
End Class


