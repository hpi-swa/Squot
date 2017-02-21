delegate
directoryAt: aPath ifAbsent: absentBlock nodesDo: aBlock
	self ensure: aPath.
	"load the directory into the cache"
	(modManager treeAt: aPath) entries do: [ :gitEntry|
			self ensure: aPath / gitEntry entryName.
		].
	cacheStore directoryAt: aPath ifAbsent: absentBlock nodesDo: aBlock.