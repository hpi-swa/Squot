toolbuilder
buildHorizontalSplit: aNumber of: leftSpec and: rightSpec with: builder
	^ self
		buildRow: {leftSpec. rightSpec}
		splits: {aNumber}
		with: builder