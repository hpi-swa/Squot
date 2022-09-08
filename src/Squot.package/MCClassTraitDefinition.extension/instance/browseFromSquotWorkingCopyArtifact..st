*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	| trait |
	aSquotWorkingCopyArtifact isLoaded ifFalse: [^ self browse].
	trait := (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact)
		classOrTraitNamed: self baseTrait.
	^ trait ifNotNil: [trait theMetaClass browse]