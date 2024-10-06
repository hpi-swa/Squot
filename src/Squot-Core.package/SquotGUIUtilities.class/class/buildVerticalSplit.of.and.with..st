toolbuilder
buildVerticalSplit: aNumber of: leftSpec and: rightSpec with: builder
	^ self
		buildColumn: {leftSpec. rightSpec}
		splits: {aNumber}
		with: builder