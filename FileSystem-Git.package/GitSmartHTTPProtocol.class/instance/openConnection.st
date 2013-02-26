accessing
openConnection
	"open http connection"
	self client isConnected
		ifFalse: [ self shouldBeImplemented ].
	^ self client