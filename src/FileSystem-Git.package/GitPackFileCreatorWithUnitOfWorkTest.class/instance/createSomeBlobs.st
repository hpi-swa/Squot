running
createSomeBlobs
	basicRepository := repository.
	repository := basicRepository newUnitOfWork.
	^ super createSomeBlobs