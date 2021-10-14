toolbuilder
buildWith: aBuilder

	^ aBuilder build: ((self buildWindowWith: aBuilder)
		children: {
			self buildRepositoryLabel: aBuilder.
			self buildCommitList: aBuilder.
			self buildRepositoryButton: aBuilder.
			self buildRepositoryButtons: aBuilder};
		yourself)