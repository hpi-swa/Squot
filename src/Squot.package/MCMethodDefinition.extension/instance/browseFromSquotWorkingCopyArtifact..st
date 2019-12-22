*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	^ (self actualClassIn: (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact))
		ifNotNil: [:class | ToolSet browse: class selector: selector]