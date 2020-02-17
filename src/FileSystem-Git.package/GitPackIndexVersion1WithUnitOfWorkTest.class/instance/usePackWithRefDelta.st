running
usePackWithRefDelta
	repository := basicRepository.
	super usePackWithRefDelta.
	repository := basicRepository newUnitOfWork.