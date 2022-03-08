node creation
topNodesForMerge: aSquotPackageMerge
	packageMerge := aSquotPackageMerge.
	packageMerge operationsAndConflicts do: [:each | self addOperationOrConflict: each].
	^ self buildNodes