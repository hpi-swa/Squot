as yet unclassified
add: parentCommit asParentOf: aCommit
	paths keysAndValuesDo: [:target :dictionary |
		"dictionary stores the paths to target, each entry has the next child commit as value"
		dictionary at: aCommit ifPresent: [:x | dictionary at: parentCommit put: aCommit]].