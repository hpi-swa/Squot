accessing
trackingRefOf: remoteRefString
	| trackingRef |
	self fetchSpecs do: [:each |
		trackingRef := each trackingRefOf: remoteRefString.
		trackingRef ifNotNil: [^ trackingRef]].
	^ self error: 'No fetch spec matches the given remote ref'