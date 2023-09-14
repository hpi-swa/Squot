toolbuilder
buildVerticalSplit: aNumber of: leftSpec and: rightSpec with: builder
	^ self
		buildGrid: {leftSpec. rightSpec}
		horizontalSplits: {}
		verticalSplits: {aNumber}
		with: builder