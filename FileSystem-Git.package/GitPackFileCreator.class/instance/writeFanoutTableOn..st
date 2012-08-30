operations-writing
writeFanoutTableOn: aStream
	"fanout byte N is the offset for the object names whose first byte <= N"
	self fanoutOffsets do: [ :offset |
		aStream nextPutAll: offset ]