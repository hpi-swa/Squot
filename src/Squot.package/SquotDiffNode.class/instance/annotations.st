accessing
annotations

	^ (content respondsTo: #annotations)
		ifTrue: [content annotations]