private diffing
diffVariablePartAgainst: otherVariablePart
	"Note that otherVariablePart comes from the left side and I am on the right side of the diff."
	| changes sizeLimit |
	variableSizePart ifNil: [^ nil].
	changes := Dictionary new.
	sizeLimit := variableSizePart size min: otherVariablePart size.
	1 to: sizeLimit do: [:index | | itemDiff |
		itemDiff := (otherVariablePart at: index) squotDiffAgainst: (variableSizePart at: index).
		itemDiff squotHasChanges ifTrue:
			[changes at: index put: itemDiff]].
	sizeLimit < variableSizePart size ifTrue:
		[sizeLimit + 1 to: variableSizePart size do: [:index |
			changes at: index put: (variableSizePart at: index) asSquotDiffOnlyRight]].
	sizeLimit < otherVariablePart size ifTrue:
		[sizeLimit + 1 to: otherVariablePart size do: [:index |
			changes at: index put: (otherVariablePart at: index) asSquotDiffOnlyLeft]].
	^ changes