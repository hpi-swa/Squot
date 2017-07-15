initialize-release
addPackageInfoForDirectory: directoryReference at: relativePath
	| packageInfo hasWorkingCopy directoryPackageName |
	packageInfo := SquotCypressCodeDeserializer new packageIn: directoryReference.
	(hasWorkingCopy := packageInfo mcPackage hasWorkingCopy)
		ifFalse: [packageInfo classes , packageInfo extensionClasses
				ifEmpty: [^ self"not loaded"]].
	directoryPackageName := directoryReference basename copyUpToLast: $..
	(hasWorkingCopy and: [(directoryPackageName beginsWith: packageInfo name)
	and: [(directoryPackageName allButFirst: packageInfo name size) notEmpty]])
		ifTrue: ["seems to be a 'branch' package, check the loaded version"
			packageInfo workingCopy ancestors ifNotEmpty:
				[:ancestors | ancestors first packageAndBranchName = directoryPackageName
					ifFalse: [^ self "loaded a different 'branch'"]]].
	store
		addLoadedPackageInfoNamed: packageInfo name
		at: (SquotPath fromPath: (FSPath root resolve: relativePath))