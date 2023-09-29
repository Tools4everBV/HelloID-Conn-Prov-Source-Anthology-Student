$VerbosePreference = "SilentlyContinue"
$InformationPreference = "Continue"
$WarningPreference = "Continue"


$config = ConvertFrom-Json $configuration;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;



if($config.IncludeStatuses.length -gt 0) {
    $statusIncluded = $config.IncludeStatuses -split ','
}

if($config.ExcludeShifts.length -gt 0) {
    $shiftsExcluded = $config.ExcludeShifts -split ','
}
Student

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "ApplicationKey $($config.ApplicationKey)")

$total = 0;
$i = 0;
$results = [System.Collections.Generic.List[PSCustomObject]]::new()
while($true) {
    $parameters = @{
        '$top' = [int]$config.PageSize
        '$skip' = $i
        '$count' = 'true'
        '$select' = $config.StudentFields
    }
    Write-Verbose -Verbose "$($i):$($total)"
    $response = Invoke-RestMethod "$($config.BaseURI)/ds/campusnexus/Students" -Method 'GET' -Headers $headers -Body $parameters
    $total = $response.'@odata.count'
    foreach($item in $response.value) {
        $i++
        $results.Add($item)
    }

    Write-Verbose -Verbose "Check -- $($i):$($total)"
    if($i -ge $total) { break }

}

foreach($result in $results) {

    if($null -ne $statusIncluded) {
        if($statusIncluded -notcontains $result.SchoolStatusId) { continue; }
    }

    if($null -ne $shiftsExcluded) {
        if( $shiftsExcluded -contains $result.ShiftId) { continue; }
    }
    
    $person = @{};
        
    $person.ExternalId = $result.StudentNumber;
    $person.DisplayName = "$($result.FirstName) $($result.LastName) ($($person.ExternalId))";
        
    foreach($prop in $result.PSObject.properties)
    {
        $person[$prop.Name] = "$($prop.Value)";
    }
        
    foreach($item in $shiftData)
    {
        if($item.AdShiftID -eq $result.ShiftId)
        {
            $person["ShiftCode"] = $item.Code;
            $person["ShiftDescription"] = $item.Description;
            $person["ShiftActive"] = $item.Active;
        }
    }

    $person.Contracts = [System.Collections.ArrayList]@();
    $contract = @{
                    ExternalID = "$($result.StudentNumber).$($result.SchoolStatusId)"
                    SchoolStatusId = $result.SchoolStatusId
    }
    [void]$person.Contracts.Add($contract);
    Write-Output ($person | ConvertTo-Json -Depth 10);
    
}
