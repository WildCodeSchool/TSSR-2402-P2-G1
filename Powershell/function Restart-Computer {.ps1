function Restart-Computer {

    $message "Redemarrage machine"
    Write-log
    Invoke-Command -ScriptBlock { Restart-Computer -Force } -Session $session 
}
