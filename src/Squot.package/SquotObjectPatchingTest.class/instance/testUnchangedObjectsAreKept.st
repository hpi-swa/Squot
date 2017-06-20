testing
testUnchangedObjectsAreKept
	| original target instance patched |
	instance := 'foo' copy.
	original := {1. instance}.
	target := {2. instance}.
	self assert: target equals: (patched := self patch: original to: target).
	self assert: original == patched.
	self assert: (patched at: 2) == instance.