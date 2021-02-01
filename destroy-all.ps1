$destroy = "terraform destroy"
$dir = Get-ChildItem -Directory
echo "The following directories will be destroy $dir"
foreach ($d in $dir) {
    echo "Changing to $d directory..."
    Set-Location $d
    echo "TF State will be destroy, please confirm it"
    Invoke-Expression $destroy
    Set-Location ..
}
