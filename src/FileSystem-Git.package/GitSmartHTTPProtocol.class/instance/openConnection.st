private connection
openConnection
	"open http connection"
	self client isConnected
		ifFalse: [ self client initializeFromUrl: self url asString; connect ].
	self applyCredentials.
	^ self client