# HasTheFileChanged
I want to know if the last commit included changes at a specific directory path.

If you add the PoSh script to source control and then call it from a PowerShell script step in an Azure DevOps Services build pipeline with the argument "-databaseDir path/to/db/files" you can include conditional logic to only run builds if the files at a given path have updated.
