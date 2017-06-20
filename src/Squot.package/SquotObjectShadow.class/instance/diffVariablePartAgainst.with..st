private diffing
diffVariablePartAgainst: otherVariablePart with: aDiffBuilder
	"Note that otherVariablePart comes from the left side and I am on the right side of the diff."
	| changes sizeLimit |
	variableSizePart ifNil: [^ nil].
	changes := Dictionary new.
	sizeLimit := variableSizePart size min: otherVariablePart size.
	1 to: sizeLimit do: [:index | | itemDiff mine other |
		mine := variableSizePart at: index.
		other := otherVariablePart at: index.
		itemDiff := aDiffBuilder left: other right: mine.
		itemDiff squotHasChanges ifTrue:
			[changes at: index put: itemDiff]].
	sizeLimit < variableSizePart size ifTrue:
		[sizeLimit + 1 to: variableSizePart size do: [:index |
			changes at: index put: (aDiffBuilder onlyRight: (variableSizePart at: index))]].
	sizeLimit < otherVariablePart size ifTrue:
		[sizeLimit + 1 to: otherVariablePart size do: [:index |
			changes at: index put: (aDiffBuilder onlyLeft: (otherVariablePart at: index))]].
	^ changes