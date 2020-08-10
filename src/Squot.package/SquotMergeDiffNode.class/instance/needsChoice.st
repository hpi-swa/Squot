testing
needsChoice
	^ choice isNil and:
		[(content isConflict and: [content isResolved not]) or:
			[content isConflict not "is a merge" and: [content hasConflicts]]]