packages
removePackageNamed: packageName
	| artifact |
	artifact := workingCopy project artifacts
		detect:
			[:each | | package |
			package := each storeInfo references detect: [:eachReference | (eachReference at: 'type') = 'package'] ifNone: [].
			package ifNil: [false] ifNotNil: [(package at: 'packageName') = packageName]].
	workingCopy project removeArtifactAt: artifact id.