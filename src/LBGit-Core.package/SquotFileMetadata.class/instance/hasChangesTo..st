as yet unclassified
hasChangesTo: otherFileMetaData

	(self gitChangesTo: otherFileMetaData) ifNotNil: [:result | ^ result].
	(self contentChangesTo: otherFileMetaData) ifNotNil: [:result | ^ result].
	^ false