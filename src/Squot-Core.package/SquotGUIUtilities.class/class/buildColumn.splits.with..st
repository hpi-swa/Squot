toolbuilder
buildColumn: aCollection splits: anotherCollection with: builder
	^ self
		buildGrid: aCollection
		horizontalSplits: {}
		verticalSplits: anotherCollection
		with: builder