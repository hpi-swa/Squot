instance creation
on: aReference
	| class |
	class := aReference readStreamDo: [:stream |
		self subclasses detect: [:subclass | subclass canDecode: stream]].
	^ class new
		reference: aReference;
		initializeWithReference;
		yourself