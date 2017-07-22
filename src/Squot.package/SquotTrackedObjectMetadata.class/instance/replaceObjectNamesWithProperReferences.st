as yet unclassified
replaceObjectNamesWithProperReferences
	self at: #objectsReplacedByNames ifAbsent: [^ self].
	self removeKey: #objectsReplacedByNames.
	self at: #slotOverrides ifPresent: [:slotOverrides |
		self replaceObjectNamesWithReferencesInDictionaryKeys: slotOverrides].
	self at: #ignoredInstanceVariables ifPresent: [:dictionary |
		self replaceObjectNamesWithReferencesInDictionaryKeys: dictionary].