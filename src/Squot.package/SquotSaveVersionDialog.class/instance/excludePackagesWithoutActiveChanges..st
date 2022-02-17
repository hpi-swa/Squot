actions
excludePackagesWithoutActiveChanges: aCollection
	| packageNodes |
	packageNodes := ((aCollection select: [:each | each artifactDiff notNil]) select: [:each | each content isModification and: [each content object storeInfo objectClassName = #PackageInfo]]).
	packageNodes do: [:eachPackage |
		eachPackage hasActiveChildren ifFalse:
			[eachPackage artifactDiff metadata squotHasChanges ifFalse: [eachPackage exclude]]].