tests
testIdentityReplacedObject
	| binding |
	binding := Smalltalk globals bindingOf: #Smalltalk.
	self captureRestoreAndCompare: binding.