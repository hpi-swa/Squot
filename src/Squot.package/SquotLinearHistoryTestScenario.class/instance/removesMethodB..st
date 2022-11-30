tests
removesMethodB: aSquotMerge
	^ (aSquotMerge resolvedPatch diffAt: packagePath) diffOfTrackedObject operations
		anySatisfy: [:each | each isRemoval and: [each definition isMethodDefinition and: [each definition selector = 'b']]]