ui
headerText
	^ 'Conflict in {1} ({2})' asText format: {
		self label.
		self isResolved ifTrue: ['resolved'] ifFalse: ['unresolved' asText allBold]}