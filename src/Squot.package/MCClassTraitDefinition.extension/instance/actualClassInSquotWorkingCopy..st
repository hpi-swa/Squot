*Squot-Tools
actualClassInSquotWorkingCopy: aSquotWorkingCopyArtifact
	^ (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact)
		classOrTraitNamed: self baseTrait