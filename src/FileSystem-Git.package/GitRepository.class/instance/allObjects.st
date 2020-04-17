accessing-objects
allObjects
	self privateDeprecatedUseUnitOfWork.
	self flag: #todo. "also collect packed objects"
	^ self looseObjects 