testing
needsChoice
	^ choice isNil and:
		[(content isConflict and: [content isResolved not]) or:
			[content "is a merge and" hasConflicts]]