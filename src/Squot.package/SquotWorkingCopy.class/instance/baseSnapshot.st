private
baseSnapshot
	self isPreviousSnapshotUpToDate ifTrue: [^ previousSnapshot].
	loadedHistorian version
		ifNotNil: [:version |
			'Reading snapshot of previous version' displaySequentialProgress:
				[previousSnapshot := version snapshot].
			previousSnapshot artifacts
				detect: [:ea | ea wantsToBeInTableOfContents]
				ifNone: ["no Squot-tracked artifacts"
					previousSnapshot := 
					previousSnapshot createNewBuilder
						addAll: (self guessArtifactsFromFiles: version);
						buildSnapshot].
			previousVersionId := version internalId.
			^ previousSnapshot].
	^ SquotSnapshot empty