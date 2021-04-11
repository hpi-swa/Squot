accessing
atElement: aSquotCollectionElement
	| existing |
	existing := itemSlots detect: [:each | each key = aSquotCollectionElement] ifNone: [].
	^ existing
		ifNil: [(NotFound object: aSquotCollectionElement) signal]
		ifNotNil: [existing value].