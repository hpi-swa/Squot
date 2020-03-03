helpers
createSomeObjects
	basicRepository := repository.
	repository := basicRepository newUnitOfWork.
	^ super createSomeObjects