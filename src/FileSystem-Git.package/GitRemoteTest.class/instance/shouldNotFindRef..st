testing
shouldNotFindRef: aBlock
	| error |
	error := self exception: Error raisedBy: aBlock.
	self shouldNotBeATypeError: error.