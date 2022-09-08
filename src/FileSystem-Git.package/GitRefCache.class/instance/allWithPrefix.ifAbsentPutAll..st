accessing
allWithPrefix: aString ifAbsentPutAll: aBlock
	| newRefs |
	(prefixesCompletelyEnumerated includes: aString)
		ifTrue: 	[^ refs associations
					select: [:each | each exists and: [each name beginsWith: aString]]].
	newRefs := aBlock value.
	newRefs do: [:each | refs add: each. self changedRef: each].
	prefixesCompletelyEnumerated add: aString.
	^ newRefs