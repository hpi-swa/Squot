delegate
directoryAt: aPath ifAbsent: absentBlock nodesDo: aBlock
	| doneEntryNames |
	self ensure: aPath.
	doneEntryNames := Set new.
	cacheStore directoryAt: aPath ifAbsent: absentBlock nodesDo:
		[:cacheEntry | doneEntryNames add: (cacheStore basenameFromEntry: cacheEntry).
			aBlock value: cacheEntry].
	(modManager treeAt: aPath) entries do:
		[:treeEntry | (doneEntryNames includes: treeEntry entryName)
				ifFalse: [aBlock value: treeEntry]].