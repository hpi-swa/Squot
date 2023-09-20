accessing
selectedAsset: aString
	aString ifNil: [^ self selectedMapper: nil].
	self selectedMapper:
		(self mappers
			detect: [:each | (self pathToString: each path) = aString]
			ifNone: [nil]).