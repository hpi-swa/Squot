tests
testReplacedObject
	"Capture a ValueHolder whose contents will be proxied."
	| holder merge holderMerge |
	holder := ValueHolder new contents: (Smalltalk globals bindingOf: #Object); yourself.
	merge := self mergeOf: holder withChanges: [holder contents: (Smalltalk globals bindingOf: #SmallInteger)].
	holderMerge := merge mergeAt: (objectRegistry nameOf: holder).
	self assert: holderMerge hasChanges.