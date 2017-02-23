creating new versions
baseSnapshot
	self isPreviousSnapshotUpToDate ifTrue: [^ previousSnapshot].
	^ loadedHistorian version
		ifNotNil: [:version |
			previousVersionId := version internalId.
			previousSnapshot := version snapshot]
		ifNil: [SquotSnapshot empty].