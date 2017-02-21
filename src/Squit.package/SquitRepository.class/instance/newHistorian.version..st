Pur repository
newHistorian: name version: aVersion
	| fullRefName |
	gitRepository repository
		updateRef: (fullRefName := self expandShortRefName: name)
		to: aVersion hexHash.
	^ self historianNamed: fullRefName