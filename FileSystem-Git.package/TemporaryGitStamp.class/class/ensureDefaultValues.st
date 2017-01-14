instance creation
ensureDefaultValues
	"Register some values for tests and return an instance of me
	that can subsequently be used to restore the previous values."
	| tempStamp |
	tempStamp := self new.
	self defaultName: 'John Doe'.
	self defaultEmail: 'john@foo.com'.
	^ tempStamp name: self defaultName; email: self defaultEmail; yourself