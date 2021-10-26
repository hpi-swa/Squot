tests
testIdentitySet
	| set restoredSet |
	set := IdentitySet with: {nil} with: {nil}.
	set add: set. "This would not work with regular Sets."
	restoredSet := self captureAndRestore: set.
	self assert: 2 equals: (restoredSet count: [:each | each = #(nil)]);
		assert: (restoredSet includes: restoredSet).