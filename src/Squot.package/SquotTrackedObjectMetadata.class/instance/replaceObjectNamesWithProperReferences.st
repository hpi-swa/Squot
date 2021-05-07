as yet unclassified
replaceObjectNamesWithProperReferences
	self at: #objectsReplacedByNames ifAbsent: [^ self].
	self removeKey: #objectsReplacedByNames.
	self at: #slotOverrides ifPresent: [:slotOverrides |
		self at: #slotOverrides put: (self replaceObjectNamesWithReferencesInDictionaryKeys: slotOverrides)].
	self at: #ignoredInstanceVariables ifPresent: [:dictionary |
		self at: #ignoredInstanceVariables put: (self replaceObjectNamesWithReferencesInDictionaryKeys: dictionary)].