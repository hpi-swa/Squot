compatibility
compatibleOperationClasses
	^ self operationClasses select: [:each | self canChangeTo: each]