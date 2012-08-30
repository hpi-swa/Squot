as yet unclassified
loadDefinitionsFrom: aFile into: aStream
	^ self new 
		definitions: aStream;
		readFrom: aFile