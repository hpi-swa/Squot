public-accessing
nearestMergeBaseWithAnyOf: aCollectionOfHashes
	| commits |
	commits := OrderedCollection withAll:
		(aCollectionOfHashes collect: [:each | repository objectNamed: each ifAbsent: []]).
	commits removeAllSuchThat: [:each | each isNil].
	commits replace: [:each | each asCommit].
	^ (VersionsMergeBase of: self andAnyOf: commits) version