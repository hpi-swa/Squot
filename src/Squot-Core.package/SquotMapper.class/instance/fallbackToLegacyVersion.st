accessing
fallbackToLegacyVersion
	self version ifNil: [self setLegacyVersion].