*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	categories ifEmpty: [^ self].
	^ (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact) beCurrentDuring:
		[ToolSet browseCategory: categories anyOne]