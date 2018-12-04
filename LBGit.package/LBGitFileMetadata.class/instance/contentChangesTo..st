as yet unclassified
contentChangesTo: otherFileMetaData

	(self contents isNil or: [otherFileMetaData contents isNil]) ifTrue: [^nil].
	^ self contents ~= otherFileMetaData contents