param(
    [string]$databaseDir = "Applications"
)

# determining if there are changes to this file
$lastCommit = git log -n 1 --pretty=format:%H
Write-Host "LastCommit is: $lastCommit"

$lastCommitToFile = git log -n 1 --pretty=format:%H -- $databaseDir
Write-Host "LastCommitToFile is: $lastCommitToFile"

# if there are changes to this file, print them
if (Compare-Object $lastCommit $lastCommitToFile) {
    write-host "The hashes don't match, so there were no changes in this directory."
    write-host "Skipping this database."
    }
else {
    write-host "Uh oh the hashes match - that means someone made a change."
    write-host "Let's double check what my random changes are!"

    # getting file paths
    $gitRoot = git rev-parse --show-toplevel
    $fullyQualifiedDatabaseDir = Join-Path -Path $gitRoot -ChildPath $databaseDir

    # finding the text in the file
    $textfile = Join-Path -Path $fullyQualifiedDatabaseDir -ChildPath "randomChanges.txt" 
    $text = Get-Content $textfile
    
    write-host "The new text is:" 
    write-host $text
}