history walking
startingFrom: aVersion do: aBlock
	aVersion ifNil: [^ self].
	versionBlock := aBlock.
	self addStart: aVersion.
	self performSearch.