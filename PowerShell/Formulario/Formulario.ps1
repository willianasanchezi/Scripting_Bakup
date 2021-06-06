using assembly System.Windows.Forms
using namespace System.Windows.Forms
$form = [Form] @{Text = 'Formulario'}
$button = [Button] @{Text = 'Push Me!'; Dock = 'Fill'}
$button.add_Click{
$form.Close()
}
$form.Controls.Add($button)
$form.ShowDialog()