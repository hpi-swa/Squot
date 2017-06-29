accessing
updateCacheAt: aPath with: aGitTree.
	(aGitTree isTree and: [aGitTree isEmpty]) ifTrue:
		[self logMessage: 'Putting empty tree at ', aPath printString].
	treeMap 
		at: aPath
		ifAbsentPut: [aGitTree]