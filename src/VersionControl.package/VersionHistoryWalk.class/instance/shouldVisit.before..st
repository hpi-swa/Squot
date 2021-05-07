adapting
shouldVisit: markedVersion1 before: markedVersion2
	"Answer true if version1 should be visited before version2.
	Subclasses can override this to change the iteration order
	or to change the messages sent and, thus, the sorting criteria."
	^ markedVersion1 object timeStamp > markedVersion2 object timeStamp