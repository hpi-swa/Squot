reading
readEntryFrom: aStream
	entries add: (GitIndexEntry readFrom: aStream indexVersion: version).