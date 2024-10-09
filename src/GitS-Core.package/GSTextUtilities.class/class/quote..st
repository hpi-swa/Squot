quoting
quote: aString
	aString ifEmpty: [^ '''''' "two single quotes"].
	^ String streamContents: [:stream | | currentQuote |
		currentQuote := nil.
		aString do: [:each | | newQuote |
			newQuote := each = $' ifTrue: [$"] ifFalse: [$'].
			currentQuote = newQuote ifFalse: [
				currentQuote ifNotNil: [stream nextPut: currentQuote].
				stream nextPut: newQuote.
				currentQuote := newQuote].
			stream nextPut: each].
		stream nextPut: currentQuote]