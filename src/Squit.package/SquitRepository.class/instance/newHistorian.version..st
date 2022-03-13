Pur repository
newHistorian: name version: aVersion
	| fullRefName |
	fullRefName := self expandShortRefName: name.
	aVersion ifNotNil:
		[self git
			updateRef: fullRefName
			to: aVersion hexHash].
	Project current addDeferredUIMessage: [self changed: #historians].
	^ self historianNamed: fullRefName