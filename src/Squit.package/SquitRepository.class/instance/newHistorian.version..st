Pur repository
newHistorian: name version: aVersion
	| fullRefName |
	fullRefName := self expandShortRefName: name.
	aVersion ifNotNil:
		[self git
			updateRef: fullRefName
			to: aVersion hexHash].
	^ self historianNamed: fullRefName