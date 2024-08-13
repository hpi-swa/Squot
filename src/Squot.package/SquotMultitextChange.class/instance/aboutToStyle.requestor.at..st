ui
aboutToStyle: aStyler requestor: requestor at: aNumber
	^ self isInEditMode and:
		[self model aboutToStyle: self someVersion with: aStyler requestor: requestor at: aNumber]