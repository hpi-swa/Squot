writing
next: anInteger putAll: aCollection startingAt: startIndex
	"Store the next anInteger elements from the given collection."
	
	startIndex to: startIndex + anInteger - 1 do: [ :index |
		self nextPut: (aCollection at: index) ].
	^aCollection