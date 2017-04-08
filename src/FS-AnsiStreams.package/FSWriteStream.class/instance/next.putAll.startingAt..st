writing
next: anInteger putAll: aCollection startingAt: startIndex
	"Store the next anInteger elements from the given collection."
	isBinary ifTrue: [^ self basicNext: anInteger putAll: aCollection startingAt: startIndex].
	^ self converter next: anInteger putAll: aCollection startingAt: startIndex toStream: self