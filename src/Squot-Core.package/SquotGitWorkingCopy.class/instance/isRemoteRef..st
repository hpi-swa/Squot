refs
isRemoteRef: aString
	^ (aString beginsWith: self remoteRefBaseName)
		and: [(aString occurrencesOf: $/) >= ((self remoteRefBaseName occurrencesOf: $/) + 1)]