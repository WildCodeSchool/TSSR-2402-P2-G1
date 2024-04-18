function sesionactive {
    
    $message = "Vérification des sessions active"
    Write-log
    Invoke-Command query session
    
}