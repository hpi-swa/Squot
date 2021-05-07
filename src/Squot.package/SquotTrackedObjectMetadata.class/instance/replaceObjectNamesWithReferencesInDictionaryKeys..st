as yet unclassified
replaceObjectNamesWithReferencesInDictionaryKeys: aDictionary
	| newAssociations |
	newAssociations := OrderedCollection new: aDictionary size.
	aDictionary keysAndValuesDo: [:name :dictionary |
		newAssociations add: (SquotActiveObjectRegistry objectNamed: name) -> dictionary].
	^ IdentityDictionary newFrom: newAssociations