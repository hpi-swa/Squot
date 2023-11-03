accessing-sources
isReadOnly: aNumber
	^ self isReadOnly or: [self isSourceTimeStamp: aNumber]