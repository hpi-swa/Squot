ston-core
fromSton: aStream
	self basicVersion: nil.
	super fromSton: aStream.
	self fallbackToLegacyVersion.