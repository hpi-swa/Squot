*GitS-Core-Code
gitSAboutToStyle: aStyler requestor: requestor at: aNumber
	aNumber = 2 ifTrue: [
		"source"
		aStyler
			parseAMethod: true;
			classOrMetaClass: self actualClass].
	^ super gitSAboutToStyle: aStyler requestor: requestor at: aNumber