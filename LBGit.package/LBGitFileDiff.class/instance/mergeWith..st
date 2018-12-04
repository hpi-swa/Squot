as yet unclassified
mergeWith: anotherFileDiff

	^ (LBGitFileConflict left: self right: anotherFileDiff)
		path: self path;
		yourself   