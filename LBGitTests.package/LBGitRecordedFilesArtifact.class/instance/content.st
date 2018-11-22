as yet unclassified
content

	^ self trackedFiles 
		ifNil: [self collectTrackedFiles. self trackedFiles]