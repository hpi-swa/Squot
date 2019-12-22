tools
browseInSquotWorkingCopy: aWorkingCopy
	^ ((PackageInfo squotEnvironmentOf:
			(diffTreeNode workingCopy artifactAt: diffTreeNode artifactDiff path))
		classOrTraitNamed: className)
		browse