initialize-release
loadFrom: aStream
	[ aStream atEnd ] whileFalse: [ | entry |
		entry := (GitTreeEntry in: repository) loadFrom: aStream.
		self putEntry: entry ].
	^ self