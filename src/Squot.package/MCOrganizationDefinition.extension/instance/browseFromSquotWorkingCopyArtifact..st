*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	categories ifEmpty: [^ self].
	aSquotWorkingCopyArtifact isLoaded ifFalse: [^ self browse].
	^ (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact) beCurrentDuring:
		[ToolSet browseCategory: categories anyOne]