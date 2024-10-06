*Squot-Core-Code
squotAboutToStyle: aStyler requestor: requestor at: aNumber
	aNumber = 2 ifTrue: [
		"source"
		aStyler
			parseAMethod: true;
			classOrMetaClass: self actualClass].
	^ super squotAboutToStyle: aStyler requestor: requestor at: aNumber