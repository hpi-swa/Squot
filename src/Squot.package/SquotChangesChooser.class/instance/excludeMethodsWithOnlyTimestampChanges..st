actions
excludeMethodsWithOnlyTimestampChanges: aCollection
	aCollection do: [:eachPackageNode |
		eachPackageNode children do: [:eachClassNode |
			eachClassNode children
				select: [:each | each title endsWith: '(only different time stamp)']
				thenDo: [:each | each exclude].
			eachClassNode hasActiveChildren ifFalse: [eachClassNode exclude]]].