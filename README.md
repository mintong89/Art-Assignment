# Art Gallery Sales System
ASP.NET Assignment with .NET Framework 4.7.2

## How to setup MSSQL LocalDB Database
Just run `DBSetup.bat` inside `scripts` folder, it will delete the existing LocalDB instance and Database and recreate a new one from scratch
| Field | Value |
| ----- | ----- |
| Server Name | (localdb)\ArtDBInstance |
| Database Name | ArtDB |

## How to handle page authorization:
1. Add these into `<configuration>` of `Web.Config`
```xml
<configSections>
  <section name="loozMembership" type="LoozMembershipConfig.LoozMemebershipSection"/>
</configSections>
<loozMembership>
  <membership>
    <add path="/Pages/Profile/path1.aspx" requiredRoles="User"></add>
    <add path="/Pages/Profile/path2.aspx" requiredRoles="User"></add>
  </membership>
</loozMembership>
```

2. On Page Load, call `Art_Assignment.Utility.Auth.useAuthorizationMiddleware(Request, Response, HttpContext.Current, Server);`
This method will handle all authorization

3. inside `<membership>`, may set absolute path to define the required roles, wildcard (*) can be used. (e.g. `/Pages/Profile/\*` would refer to all paths that start with `/Pages/Profile/`

Note 1: User role will usually be stored inside the JWT token.
Note 2: 1 path may accept multiple roles, use `,` to separate the roles. (e.g. `requiredRoles="User,Admin,Staff"` will allow user with `User`, `Admin` and `Staff` role to access the path)

### See Also
[Auth.cs](Art%20Assignment/Utility/Auth.cs) | [Auth.cs](Art%20Assignment/Utility/LoozMemebershipConfig.cs)