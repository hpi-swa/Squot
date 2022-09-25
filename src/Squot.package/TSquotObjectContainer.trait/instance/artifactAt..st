accessing objects
artifactAt: pathOrId
	^ SquotToggles useNewApi
		ifTrue: "Id is the key. Lookup by path as well for backwards compatibility."
			[self artifacts at: pathOrId
				ifAbsent: [self artifacts detect: [:each | (each storeInfo at: 'path' ifAbsent: []) = pathOrId] ifNone: [(KeyNotFound key: pathOrId) signal]]]
		ifFalse: "Path is the key, look it up."
			[self artifacts at: pathOrId]