git porcelain - external
commandExists: aString
	^ (ShellSyntax new findExecutablePathFor: (aString copyUpTo: Character space) inDirectoryPath: nil) notNil