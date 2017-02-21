private connection
openConnection
	"open http connection"
	self client isConnected
		ifFalse: [ self client initializeFromUrl: self url asString; connect ].
	credentials ifNotNil: [ self client username: credentials first; password: credentials second ].
	^ self client