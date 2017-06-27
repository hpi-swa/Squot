testing
testIdentityReplacedObject
	| binding1 binding2 diff |
	binding1 := Smalltalk globals bindingOf: #Smalltalk.
	binding2 := self class environment bindingOf: self class name.
	diff := (capturer capture: {binding1}) squotDiffAgainst: (capturer capture: {binding2}).
	self assert: diff squotHasChanges.
	diff := (capturer capture: {binding1}) squotDiffAgainst: (capturer capture: {binding1}).
	self deny: diff squotHasChanges.