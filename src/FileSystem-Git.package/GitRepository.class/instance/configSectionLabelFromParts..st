private configuration
configSectionLabelFromParts: aCollectionOfStrings
	| key sectionHead |
	self privateDeprecatedUseUnitOfWork.
	sectionHead := aCollectionOfStrings first.
	key := aCollectionOfStrings last.
	^ aCollectionOfStrings size = 1
		ifTrue: [sectionHead]
		ifFalse: [sectionHead, ' "', (aCollectionOfStrings allButFirst joinSeparatedBy: ','), '"']