tests
testReplacedObject
	"Capture a ValueHolder whose contents will be proxied."
	| holder diff holderDiff |
	holder := ValueHolder new contents: (Smalltalk globals bindingOf: #Object); yourself.
	diff := self diff: holder againstItselfAfter: [holder contents: (Smalltalk globals bindingOf: #SmallInteger)].
	holderDiff := diff diffForObjectNamed: (objectRegistry nameOf: holder).
	self assert: holderDiff squotHasChanges.