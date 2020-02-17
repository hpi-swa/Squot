accessing-objects
allObjects
	self flag: #todo. "also collect packed objects"
	^ self looseObjects 