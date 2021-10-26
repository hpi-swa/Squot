Squot-diff-patching
squotApplyTo: anObjectGraph
	| newGraph oldImplementation newImplementation |
	self hasChanges ifFalse: [^ anObjectGraph].
	newGraph := anObjectGraph mutableCopy.
	oldImplementation := 
		[diffs keysAndValuesDo:
			[:name :diff | newGraph applyDiff: diff toShadowNamed: name]].
	newImplementation := "Does not work until object graph merges compute the right side of the resolved patch by themselves. Moreover it touches all remaining objects rather than just the changed ones and their referrers."
		[right shadows
			do: 	[:each | newGraph assign: (right nameOf: each) toShadow: each].
		newGraph evictObjectNames].
	oldImplementation value flag: #todo.
	newGraph refreshStartShadow.
	^ newGraph asShadowGraph