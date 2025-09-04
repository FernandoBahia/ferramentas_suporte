# ============================
# MENU DE SUPORTE E REPARO - STARIAN
# por Fernando Bahia - V1.0
# Interface Gráfica em PowerShell
# ============================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Menu de Suporte Técnico - STARIAN"
$form.Size = New-Object System.Drawing.Size(500,700)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(30,30,30)

$y = 20
$buttons = @(
    @{Text="1. Verificar Disco (CHKDSK)"; Action={Start-Process cmd "/c chkdsk && pause" -Verb RunAs}},
    @{Text="2. Reparar Arquivos (SFC)"; Action={Start-Process cmd "/c sfc /scannow && pause" -Verb RunAs}},
    @{Text="3. Limpar Temporários"; Action={Start-Process cleanmgr -Verb RunAs}},
    @{Text="4. Verificar Memória"; Action={Start-Process mdsched -Verb RunAs}},
    @{Text="5. Restaurar Sistema"; Action={Start-Process rstrui -Verb RunAs}},
    @{Text="6. Testar Rede (Ping)"; Action={Start-Process cmd "/c ping 8.8.8.8 -n 5 && pause"}},
    @{Text="7. Gerenciar Processos"; Action={Start-Process taskmgr}},
    @{Text="8. Backup de Drivers"; Action={[System.Windows.Forms.MessageBox]::Show('Função precisa de script extra!')}},
    @{Text="9. Verificar Atualizações"; Action={Start-Process powershell -ArgumentList "Get-WindowsUpdateLog"}},
    @{Text="10. Informações do Sistema"; Action={Start-Process cmd "/c systeminfo | more && pause"}},
    @{Text="11. Limpar DNS Cache"; Action={Start-Process cmd "/c ipconfig /flushdns && pause"}},
    @{Text="12. Resetar Rede"; Action={Start-Process cmd "/c netsh winsock reset && netsh int ip reset && pause" -Verb RunAs}},
    @{Text="13. Desfragmentar Disco"; Action={Start-Process cmd "/c defrag C: && pause" -Verb RunAs}},
    @{Text="14. Gerenciar Usuários"; Action={Start-Process lusrmgr.msc -Verb RunAs}},
    @{Text="15. Verificar Integridade (DISM)"; Action={Start-Process cmd "/c DISM /Online /Cleanup-Image /ScanHealth && pause" -Verb RunAs}},
    @{Text="16. Firewall Off"; Action={Start-Process cmd "/c netsh advfirewall set allprofiles state off && pause" -Verb RunAs}},
    @{Text="17. Logs de Eventos"; Action={Start-Process eventvwr}},
    @{Text="18. Testar Disco (Winsat)"; Action={Start-Process cmd "/c winsat disk && pause"}},
    @{Text="19. Criar Ponto de Restauração"; Action={Start-Process powershell -ArgumentList "Checkpoint-Computer -Description 'Ponto Manual'" -Verb RunAs}},
    @{Text="20. Abrir CMD"; Action={Start-Process cmd}},
    @{Text="21. Atualizar Programas (Winget)"; Action={Start-Process cmd "/c winget update --all && pause" -Verb RunAs}},
    @{Text="22. Sair"; Action={$form.Close()}}
)

foreach ($btn in $buttons) {
    $button = New-Object System.Windows.Forms.Button
    $button.Text = $btn.Text
    $button.Size = New-Object System.Drawing.Size(450,28)
    $button.Location = New-Object System.Drawing.Point(15,$y)
    $button.BackColor = [System.Drawing.Color]::FromArgb(50,50,50)
    $button.ForeColor = [System.Drawing.Color]::White
    $button.Font = New-Object System.Drawing.Font("Consolas",10,[System.Drawing.FontStyle]::Bold)
    $button.FlatStyle = "Flat"
    $button.Add_Click($btn.Action)
    $form.Controls.Add($button)
    $y += 32
}

[void]$form.ShowDialog()
