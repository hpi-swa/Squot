reading
next: anInteger
	| fromSource |
	position := position + anInteger.
	sourceStream atEnd
		ifTrue: [^ sourceStream contents species new: anInteger].
	fromSource := sourceStream next: anInteger.
	fromSource size < anInteger ifTrue:
		[^ fromSource, (fromSource contents species new: (anInteger - fromSource size))].
	^ fromSource