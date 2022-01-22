node creation
topNodesForMerge: aSquotPackageMerge
	packageMerge := aSquotPackageMerge.
	self detectClassCategories.
	packageMerge operationsAndConflicts do: [:each | self addOperationOrConflict: each].
	^ self buildNodes