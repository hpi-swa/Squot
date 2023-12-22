git porcelain - external
commandExists: aString
	^ (ShellSyntax new findExecutablePathFor: aString inDirectoryPath: nil) notNil