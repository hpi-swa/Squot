*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	aSquotWorkingCopyArtifact isLoaded ifFalse: [^ self browse].
	^ (self actualClassIn: (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact)) 
		ifNotNil: [:class | class browse]