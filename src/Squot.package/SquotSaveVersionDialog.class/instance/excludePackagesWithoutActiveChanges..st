actions
excludePackagesWithoutActiveChanges: aCollection
	aCollection do: [:eachPackage |
		eachPackage hasActiveChildren ifFalse:
			[eachPackage artifactDiff metadata squotHasChanges ifFalse: [eachPackage exclude]]].