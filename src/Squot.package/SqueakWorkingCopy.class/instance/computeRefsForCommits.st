accessing
computeRefsForCommits
	^ self withUnitOfWork: [self unitOfWork allReferences
								groupBy: [:each | self unitOfWork resolveRef: each]]