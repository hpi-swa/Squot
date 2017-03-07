private
isPreviousSnapshotUpToDate
	| baseVersion |
	^ (baseVersion := loadedHistorian version) notNil
		and: [previousVersionId = loadedHistorian version internalId
			and: [previousSnapshot notNil]]