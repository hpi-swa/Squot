tests
testIdentityReplacedObject
	| binding1 binding2 diff holder |
	binding1 := Smalltalk globals bindingOf: #Smalltalk.
	binding2 := self class environment bindingOf: self class name.
	holder := ValueHolder new contents: binding1.
	diff := self diff: holder againstItselfAfter: [holder contents: binding2].
	self assert: diff squotHasChanges.
	diff := self diff: holder againstItselfAfter: [].
	self deny: diff squotHasChanges.