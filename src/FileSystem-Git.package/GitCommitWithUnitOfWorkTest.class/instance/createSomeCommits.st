helpers
createSomeCommits
	basicRepository := repository.
	repository := basicRepository newUnitOfWork.
	^ super createSomeCommits