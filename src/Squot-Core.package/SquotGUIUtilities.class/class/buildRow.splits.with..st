toolbuilder
buildRow: aCollection splits: anotherCollection with: builder
	^ self
		buildGrid: aCollection
		horizontalSplits: anotherCollection
		verticalSplits: {}
		with: builder