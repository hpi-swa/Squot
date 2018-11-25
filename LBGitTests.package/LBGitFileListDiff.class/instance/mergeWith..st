as yet unclassified
mergeWith: otherFileListDiff
	
	| commonPaths resultingDiffs |
	resultingDiffs := OrderedCollection new.
	commonPaths := self diffPaths intersection: otherFileListDiff diffPaths.
	resultingDiffs addAll: (self diffs reject: [:each | commonPaths includes: each path]).
	resultingDiffs addAll: (otherFileListDiff diffs reject: [:each | commonPaths includes: each path]).
	resultingDiffs addAll: (commonPaths collect: [:each | (self diffAt: each) mergeWith: (otherFileListDiff diffAt: each)]).
	self halt.
	^ LBGitFileListDiff new 
		left: self right;
		right: otherFileListDiff right;
		diffs: resultingDiffs