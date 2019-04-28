as yet unclassified
mergeWith: anotherFileDiff

	^ (SquotFileConflict left: self right: anotherFileDiff)
		path: self path;
		yourself   