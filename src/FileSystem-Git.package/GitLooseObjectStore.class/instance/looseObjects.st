private
looseObjects
	| r |
	r := OrderedCollection new.
	self looseObjectsDo: [ :n | r add: n ].
	^ r