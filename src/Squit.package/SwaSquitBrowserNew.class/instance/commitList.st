as yet unclassified
commitList

	| walker count commits |
	walker := self selectedRepository loadedHistorian repository historyWalkClass new.
	walker nextPut: self selectedRepository loadedHistorian version.
	count := 0.
	commits := Array streamContents: [:stream |
		[walker atEnd or: [count > 30]] whileFalse: [
			stream nextPut: walker next.
			count := count + 1]].
	^ {
		[:commit | self formatDate: commit timestamp].
		[:commit | String streamContents: [:s | commit timestamp printHMSOn: s]].
		[:commit | commit metadata at: #author].
		[:commit | commit message]} withIndexCollect: [:columnBlock :columnIndex | commits collect: [:commit | columnBlock value: commit]]