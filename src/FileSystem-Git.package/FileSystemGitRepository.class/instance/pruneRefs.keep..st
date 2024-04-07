git porcelain
pruneRefs: aFetchSpec keep: aCollection
	self withUnitOfWork: [
		((self unitOfWork allReferences
			select: [:each | aFetchSpec trackingRefPattern match: each])
			copyWithoutAll: aCollection)
			do: [:each | self unitOfWork deleteRef: each]].