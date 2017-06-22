testing
testIdentityReplacedObject
	| binding1 binding2 diff |
	binding1 := Smalltalk globals bindingOf: #Smalltalk.
	binding2 := self class environment bindingOf: self class name.
	diff := {binding1} captureWithSquot squotDiffAgainst: {binding2} captureWithSquot.
	self assert: diff squotHasChanges.
	diff := {binding1} captureWithSquot squotDiffAgainst: {binding1} captureWithSquot.
	self deny: diff squotHasChanges.