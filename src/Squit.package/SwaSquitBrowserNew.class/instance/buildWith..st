as yet unclassified
buildWith: aBuilder

	^ aBuilder build: ((self buildWindowWith: aBuilder)
		children: {
			self buildRepositoryList: aBuilder.
			self buildCommitList: aBuilder.
			self buildSyncButton: aBuilder.
			self buildRepositoryButtons: aBuilder};
		extent: 300 @ 200;
		yourself)