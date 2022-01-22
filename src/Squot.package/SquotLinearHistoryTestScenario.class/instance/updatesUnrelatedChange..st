tests unrelated change
updatesUnrelatedChange: aSquotMerge
	^ (aSquotMerge resolvedPatch diffAt: packagePath) diffOfTrackedObject operations 
		anySatisfy: [:each | each definition isMethodDefinition and: [each definition selector = 'c']]