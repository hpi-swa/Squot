testing
testIdentityReplacedObject
	| binding |
	binding := Smalltalk globals bindingOf: #Smalltalk.
	self captureAndRestore: binding.