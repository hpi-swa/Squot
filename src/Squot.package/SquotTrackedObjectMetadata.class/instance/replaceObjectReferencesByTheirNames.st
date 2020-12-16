as yet unclassified
replaceObjectReferencesByTheirNames
	self at: #objectsReplacedByNames ifPresent: [:x | ^ self].
	self at: #objectsReplacedByNames ifAbsentPut: true.
	self at: #slotOverrides ifPresent: [:slotOverrides |
		self at: #slotOverrides put: (self replaceObjectReferencesByNamesInDictionaryKeys: slotOverrides)].
	self at: #ignoredInstanceVariables ifPresent: [:dict |
		self at: #ignoredInstanceVariables put: (self replaceObjectReferencesByNamesInDictionaryKeys: dict)].