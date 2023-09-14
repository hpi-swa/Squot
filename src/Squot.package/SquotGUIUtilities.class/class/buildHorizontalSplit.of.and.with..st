toolbuilder
buildHorizontalSplit: aNumber of: leftSpec and: rightSpec with: builder
	^ self
		buildGrid: {leftSpec. rightSpec}
		horizontalSplits: {aNumber}
		verticalSplits: {}
		with: builder