instance creation
ensureDefaultValues
	"Register some values for tests and return an instance of me
	that can subsequently be used to restore the previous values."
	| tempStamp |
	tempStamp := self basicNew initialize.
	self defaultName: 'John Doe'.
	self defaultEmail: 'john@example.com'.
	^ tempStamp name: self defaultName; email: self defaultEmail; yourself