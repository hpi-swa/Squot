running
usePackWithTag
	repository := basicRepository.
	super usePackWithTag.
	repository := basicRepository newUnitOfWork.