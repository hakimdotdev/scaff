function scaff {
  # Get databases
  $databases = Get-ChildItem "Microsoft.SqlServer.Management.Sdk.Sfc\Root\Microsoft\SqlServer\Computer\SQLEXPRESS\Databases"

  # Prompt
  $selectedDatabase = $databases | Out-Host -Paging

  # Get conn string
  $connectionString = $selectedDatabase.GetConnectionContext().ConnectionString

  # Execute Scaffold-DbContext with conn string
  Scaffold-DbContext "$connectionString" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
}
