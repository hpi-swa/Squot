*Squot-Tools
browseFromSquotWorkingCopyArtifact: aSquotWorkingCopyArtifact
	| trait |
	trait := (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact)
		classOrTraitNamed: self baseTrait.
	^ trait ifNotNil: [trait theMetaClass browse]