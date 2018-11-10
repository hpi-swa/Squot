as yet unclassified
chosenOption

	^ self isLeftChosen 
		ifTrue: [self options first]
		ifFalse: [self options second]