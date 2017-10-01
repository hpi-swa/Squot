public
truncateTo: anInteger
	Primitives setPosition: id to: anInteger - 1.
	Primitives truncate: id to: anInteger.
	self reopen