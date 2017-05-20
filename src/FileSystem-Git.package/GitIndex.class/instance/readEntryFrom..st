as yet unclassified
readEntryFrom: aStream
	entries add: (GitIndexEntry readFrom: aStream indexVersion: version).