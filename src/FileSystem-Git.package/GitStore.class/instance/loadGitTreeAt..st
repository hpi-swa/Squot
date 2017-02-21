internal
loadGitTreeAt: aPath
	"recursivel walk through all the git trees and resolve the path"
	|currentGitTree|
	currentGitTree := modManager rootTree.
	
	(aPath withParents reject: [ :path | path isRoot]) do: [ :path |
		currentGitTree isTree ifFalse: [ ^ nil ]. 
		currentGitTree
			entryAt: path basename
			ifPresent: [ :entry | 
				currentGitTree := entry object.
				self updateCacheAt: path with: currentGitTree.]
			ifAbsent: [ ^ nil ] ].
	^ currentGitTree