accessing
upToAnyOf: aCollection 
	"Answer a subcollection from the current access position to the 
	occurrence (if any, but not inclusive) of any object in the collection. If 
	no matching object is found, answer the entire rest of the receiver."
	"Copied from PositionableStream, timestamp nice 12/7/2009 08:38"
	^self upToAnyOf: aCollection do: [:matchingObject | ]