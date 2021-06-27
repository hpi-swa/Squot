testing
testAddObjectThatRefersToExisting
	"Existing objects referenced by new objects should not be duplicated just because the 
	new objects are created new."
	| object existing new patched |
	object := Array with: (existing := ValueHolder new) with: nil.
	patched := self patchedCopyOf: object toReproduce:
		[object at: 2 put: (new := ValueHolder new contents: existing)].
	self assert: (patched startObject at: 1) == (patched startObject at: 2) contents.