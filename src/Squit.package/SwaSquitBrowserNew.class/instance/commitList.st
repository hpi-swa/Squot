as yet unclassified
commitList

	| walker count |
	walker := (self selectedRepository ifNil: [^ #()]) loadedHistorian repository historyWalkClass new.
	walker nextPut: self selectedRepository loadedHistorian version.
	count := 0.
	^ Array streamContents: [:stream |
		[walker atEnd or: [count > 30]] whileFalse: [
			stream nextPut: walker next.
			count := count + 1]]
