as yet unclassified
replaceObjectNamesWithReferencesInDictionaryKeys: anIdentityDictionary
	| newAssociations |
	newAssociations := OrderedCollection new: anIdentityDictionary size.
	anIdentityDictionary keysAndValuesDo: [:name :dictionary |
		newAssociations add: (SquotActiveObjectRegistry objectNamed: name) -> dictionary].
	anIdentityDictionary removeAll.
	anIdentityDictionary addAll: newAssociations.