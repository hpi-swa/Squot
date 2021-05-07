*Squot-Tools
squotChangeAsStringOrText
	^ self localChosen ifTrue: [''] ifFalse: [self operation squotChangeAsStringOrText]