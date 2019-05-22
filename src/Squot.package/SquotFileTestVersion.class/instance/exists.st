testing
exists
	internalId ifNil: [^ false].
	^ (repository versionsDirectory / internalId) isDirectory