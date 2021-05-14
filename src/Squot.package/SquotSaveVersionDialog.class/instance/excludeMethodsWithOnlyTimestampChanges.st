actions
excludeMethodsWithOnlyTimestampChanges
	| packageNodes |
	packageNodes := ((rootNodes select: [:each | each artifactDiff notNil]) select: [:each | each content isModification and: [each content object storeInfo objectClassName = #PackageInfo]]).
	packageNodes do: [:eachPackageNode |
		eachPackageNode children do: [:eachClassNode |
			eachClassNode children
				select: [:each | each title endsWith: '(only different time stamp)']
				thenDo: [:each | each exclude].
			eachClassNode hasActiveChildren ifFalse: [eachClassNode exclude]].
		eachPackageNode hasActiveChildren ifFalse: [eachPackageNode exclude]].