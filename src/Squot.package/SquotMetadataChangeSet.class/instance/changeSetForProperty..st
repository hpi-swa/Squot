as yet unclassified
changeSetForProperty: aSymbol
	^ self changeSets detect: [:changeSet | changeSet property = aSymbol] ifNone: [nil]