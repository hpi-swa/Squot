*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	^ (self actualClassIn: (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact)) 
		ifNotNil: [:class | class browse]