instance creation
ensureDefaultValues
	"Register some values for tests and return an instance of me
	that can subsequently be used to restore the previous values."
	| tempStamp |
	tempStamp := super name: self defaultName email: self defaultEmail timeStamp: TimeStamp now.
	self defaultName: 'John Doe'.
	self defaultEmail: 'john@foo.com'.
	^ tempStamp
		beWritableObject;
		privateName: self defaultName;
		privateEmail: self defaultEmail;
		beReadOnlyObject;
		yourself