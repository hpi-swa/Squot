as yet unclassified
gitChangesTo: otherFileMetaData

	(self entryHash isNil or: [otherFileMetaData entryHash isNil]) ifTrue: [^nil].
	^ self entryHash ~= otherFileMetaData entryHash