accessing
references
	^ refs ifNil: [refs := mirror referencesFrom: object]