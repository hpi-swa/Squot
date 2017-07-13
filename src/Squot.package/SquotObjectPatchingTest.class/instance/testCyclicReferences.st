testing
testCyclicReferences
	| original target patched |
	original := Array new: 2.
	original
		at: 1 put: original;
		at: 2 put: 2.
	target := Array new: 2.
	target
		at: 1 put: target;
		at: 2 put: 3.
	patched := self patchedFrom: original to: target.
	"cannot use assert:equals: or = to compare the results (endless recursion)"
	self assert: (patched at: 1) == patched.
	self assert: 3 equals: (patched at: 2).