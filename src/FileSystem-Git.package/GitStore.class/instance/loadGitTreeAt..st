internal
loadGitTreeAt: aPath
	"recursively walk through all the git trees and resolve the path"
	|currentGitTree basePath remainingPath|
	modManager nearestMappedParentTree: aPath
		do: [:tree :treePath | currentGitTree := tree.
			remainingPath := aPath relativeTo: (basePath := treePath)]
		ifNone: [currentGitTree := modManager rootTree.
			remainingPath := aPath.
			basePath := aPath].
	
	basePath isRoot ifFalse: [self updateCacheAt: basePath with: currentGitTree].
	remainingPath isEmpty ifTrue: [^ currentGitTree].
	(remainingPath withParents reject: [ :path | path isRoot]) do: [ :path |
		currentGitTree isTree ifFalse:
			[self logMessage: 'No tree found at ', aPath printString, ' because this is not a tree: ', (basePath resolve: path parent) printString printString.
			^ nil ]. 
		currentGitTree
			entryAt: path basename
			ifPresent: [ :entry | 
				entry isInDirectoryMode
					ifTrue: [currentGitTree := entry object.
						self updateCacheAt: (basePath resolve: path) with: currentGitTree]
					ifFalse:
						[self logMessage: 'No tree found at ', aPath printString, ' because this entry is not in dir mode: ', (basePath resolve: path) printString printString.
						^ nil]]
			ifAbsent:
				[self logMessage: 'No tree found at ', aPath printString, ' because this entry does not exist: ', (basePath resolve: path) printString printString.
				^ nil ] ].
	^ currentGitTree