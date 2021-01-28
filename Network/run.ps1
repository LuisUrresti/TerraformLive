$command = "terraform init --upgrade"
Invoke-Expression $command
$command = "terraform plan"
Invoke-Expression $command
$command = "terraform apply"
Invoke-Expression $command