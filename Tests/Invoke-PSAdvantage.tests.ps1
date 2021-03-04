Describe 'Invoke-Advantage' {
    BeforeAll {
        Import-Module -Name "$($PSScriptRoot)/../PSAdvantage.psd1" -Force
    }

    AfterAll {}

    Context 'Function Parameter validation' {
        BeforeAll {
            $SCRIPT:FunctionName = 'Invoke-Advantage'
            $SCRIPT:ModuleName = 'PSAdvantage'
        }

        It 'has a parameter "<Name>"' {
            param($Name)
                $AllParameterNames = (Get-Command -Module $ModuleName -Name $FunctionName).Parameters.Keys
                $Name | Should -BeIn $AllParameterNames
        } -TestCases @(
            @{Name = 'owner' }
            @{Name = 'reponame' }
            @{Name = 'template' }
            @{Name = 'command' }
            @{Name = 'AccessToken' }
            @{Name = 'saveLogs' }
        )
    }
}