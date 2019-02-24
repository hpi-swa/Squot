as yet unclassified
mergeWith: otherFileListDiff
	
	| commonPaths resultingDiffs |
	resultingDiffs := OrderedCollection new.
	commonPaths := self diffPaths intersection: otherFileListDiff diffPaths.
	resultingDiffs 
		addAll: (self diffs reject: [:each | commonPaths includes: each path]);
		addAll: (otherFileListDiff diffs reject: [:each | commonPaths includes: each path]);
		addAll: (commonPaths collect: [:each | (self diffAt: each) mergeWith: (otherFileListDiff diffAt: each)]).
	^ LBGitFileListDiff new 
		left: self right;
		right: otherFileListDiff right;
		diffs: resultingDiffs;
		yourself