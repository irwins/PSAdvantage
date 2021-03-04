Describe 'Invoke-Advantage' {
    BeforeAll {
        Import-Module -Name "../../PSAdvantage.psd1" -Force
    }

    AfterAll {}

    Context 'Function Parameter validation' {
        BeforeAll {
            $SCRIPT:FunctionName = 'Invoke-Advantage'
        }

        It 'has a parameter "<Name>"' {
            param($Name)
                $AllParameterNames = (Get-Command -Module 'PSAdvatange' -Name $FunctionName).Parameters.Keys
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