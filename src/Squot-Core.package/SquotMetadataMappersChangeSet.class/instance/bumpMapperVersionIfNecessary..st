accessing
bumpMapperVersionIfNecessary: aMapper
	| oldMapper changeSet |
	oldMapper := self oldMappers detect: [:each | each = aMapper] ifNone: [^ aMapper].
	oldMapper version = aMapper class currentVersion ifTrue: [^ oldMapper].
	changeSet := self mapperChangeSets at: aMapper ifAbsent: [^ oldMapper].
	changeSet isEmpty ifTrue: [^ oldMapper].
	^ aMapper copy
		setCurrentVersion;
		yourself