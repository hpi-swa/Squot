ui
aboutToStyle: aStyler requestor: requestor at: aNumber
	^ self isInEditMode and:
		[self someDefinition squotAboutToStyle: aStyler requestor: requestor at: aNumber]