testing
testIdentityReplacedObject
	"Try to capture an object that should redirect to a proxy for capturing instead."
	| binding shadow |
	binding := Smalltalk globals bindingOf: #Smalltalk.
	shadow := capturer captureStandalone: binding.