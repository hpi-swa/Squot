*Squot-Mapper
squotCopyWithSource: aString
	^ self class categories: (aString lines collect: #withBlanksTrimmed thenSelect: #notEmpty)