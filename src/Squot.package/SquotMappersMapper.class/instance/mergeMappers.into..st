merging
mergeMappers: rightMappers into: leftMappers
	| mergedMappers |
	mergedMappers := (leftMappers, rightMappers) withoutDuplicates.
	^ self changeSetFromMappers: leftMappers toMappers: mergedMappers