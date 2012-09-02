accessing
updateCacheAt: aPath with: aGitTree.
	treeMap 
		at: aPath
		ifAbsentPut: [ aGitTree]