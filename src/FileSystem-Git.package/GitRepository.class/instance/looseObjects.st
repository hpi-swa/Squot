accessing-objects
looseObjects
	| r |
	self privateDeprecatedUseUnitOfWork.
	r := OrderedCollection new.
	self looseObjectsDo: [ :n | r add: n ].
	^ r