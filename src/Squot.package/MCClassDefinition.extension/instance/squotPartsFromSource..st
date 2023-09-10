*Squot-Mapper
squotPartsFromSource: aString
	| currentPart parts |
	parts := OrderedCollection new.
	currentPart := ''.
	aString linesDo: [:line |
		line isEmpty
			ifTrue: [parts add: currentPart. currentPart := '']
			ifFalse: [currentPart := currentPart ifEmpty: [line] ifNotEmpty: [currentPart, String lf, line]]].
	parts add: currentPart.
	^ parts