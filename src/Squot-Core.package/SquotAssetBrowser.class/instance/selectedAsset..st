accessing
selectedAsset: aString
	aString ifNil: [^ self selectedMapper: nil].
	self selectedMapper:
		(self mappers
			detect: [:each | (SquotPathUtilities asString: each path) = aString]
			ifNone: [nil]).