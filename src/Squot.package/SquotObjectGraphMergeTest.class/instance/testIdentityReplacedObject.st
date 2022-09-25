tests
testIdentityReplacedObject
	| binding1 binding2 merge holder |
	binding1 := Smalltalk globals bindingOf: #Smalltalk.
	binding2 := self class environment bindingOf: self class name.
	holder := ValueHolder new contents: binding1.
	merge := self mergeOf: holder withChanges: [holder contents: binding2].
	self assert: merge hasChanges.
	merge := self mergeOf: holder withChanges: [].
	self deny: merge hasChanges.