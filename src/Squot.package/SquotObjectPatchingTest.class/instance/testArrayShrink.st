testing
testArrayShrink
	| original target |
	original := #(1 2 3).
	target := #(1 2).
	self assert: target equals: (self patchFrom: original to: target).