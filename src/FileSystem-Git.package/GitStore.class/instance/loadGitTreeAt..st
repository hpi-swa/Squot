internal
loadGitTreeAt: aPath
	"recursivel walk through all the git trees and resolve the path"
	|currentGitTree basePath remainingPath|
	modManager nearestMappedParentTree: aPath
		do: [:tree :treePath | currentGitTree := tree.
			remainingPath := aPath relativeTo: (basePath := treePath)]
		ifNone: [currentGitTree := modManager rootTree.
			remainingPath := aPath.
			basePath := aPath].
	
	basePath isRoot ifFalse: [self updateCacheAt: basePath with: currentGitTree].
	(remainingPath withParents reject: [ :path | path isRoot]) do: [ :path |
		currentGitTree isTree ifFalse: [ ^ nil ]. 
		currentGitTree
			entryAt: path basename
			ifPresent: [ :entry | 
				currentGitTree := entry object.
				self updateCacheAt: (basePath resolve: path) with: currentGitTree.]
			ifAbsent: [ ^ nil ] ].
	^ currentGitTree