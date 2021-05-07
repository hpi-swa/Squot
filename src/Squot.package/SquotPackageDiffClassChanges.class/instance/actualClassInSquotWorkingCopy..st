browsing
actualClassInSquotWorkingCopy: aSquotWorkingCopyArtifact 
	^ (PackageInfo squotEnvironmentOf: aSquotWorkingCopyArtifact)
		classNamed: className