private configuration
configSubkeysAt: aNameString
	| config subNames file hierarchicalSectionNames relevantSections |
	self privateDeprecatedUseUnitOfWork.
	file := self configFile.
	file exists ifFalse: [^ #()].
	config := file readStreamDo: [:stream | stream ascii. INIFile readFrom: stream].
	hierarchicalSectionNames := config sections collect:
		[:each | self configPartsFromSectionLabel: each label].
	subNames := aNameString splitBy: '.'.
	relevantSections := hierarchicalSectionNames select: [:each |
		each size >= subNames size
			and: [each beginsWith: subNames]].
	^ (relevantSections gather: [:sectionParts |
		sectionParts = subNames
			ifTrue: [(config section: (self configSectionLabelFromParts: sectionParts))
					associations collect: [:each | each key]]
			ifFalse: [{sectionParts at: subNames size + 1}]]) asSet asArray