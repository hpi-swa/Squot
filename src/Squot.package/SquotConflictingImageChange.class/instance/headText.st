ui
headText
	^ 'Conflict on {1} ({2})' asText format:
		{self pathString. self isResolved ifTrue: ['resolved'] ifFalse: ['unresolved' asText allBold]}