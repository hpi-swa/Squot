packages
removePackageNamed: packageName
	| artifact |
	artifact := workingCopy project artifacts
		detect:
			[:each | | package |
			package := (each storeInfo firstReferenceOfType: 'package' ifNone: []) value.
			package ifNil: [false] ifNotNil: [(package at: 'packageName') = packageName]].
	workingCopy project removeArtifactAt: artifact id.