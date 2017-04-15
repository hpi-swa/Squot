as yet unclassified
hasPathFrom: aCommit to: targetCommit
	^ paths at: targetCommit
		ifPresent: [:dictionary | dictionary includesKey: aCommit]
		ifAbsent: [^ false]