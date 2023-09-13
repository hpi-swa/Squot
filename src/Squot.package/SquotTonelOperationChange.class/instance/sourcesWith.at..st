ui
sourcesWith: aString at: aNumber
	^ self toDefinition squotSources
		at: aNumber put: aString;
		yourself