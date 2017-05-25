as yet unclassified
shouldVisit: markedVersion1 before: markedVersion2
	^ (markedVersion1 object metadata at: #timestamp) > (markedVersion2 object metadata at: #timestamp)