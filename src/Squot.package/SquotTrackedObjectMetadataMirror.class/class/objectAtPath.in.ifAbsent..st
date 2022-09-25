private reflection
objectAtPath: aSequenceableCollection in: searchMetadata ifAbsent: absentBlock
	| current mirror |
	current := searchMetadata.
	mirror := searchMetadata class squotMirror.
	aSequenceableCollection do:
		[:each | | next |
		((mirror referencesFrom: current) includes: each) ifFalse: [^ absentBlock value].
		next := mirror reflect: each of: current.
		mirror := mirror mirrorOf: next reachedVia: each from: current.
		current := next].
	^ current