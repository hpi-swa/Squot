instance creation
on: aReference
	| bytes class |
	bytes := aReference readStreamDo: [ :stream | stream binary; contents ].
	class := self subclasses detect: [ :subclass | 
		subclass canDecode: bytes ].
	^ class new
		initializeWith: bytes;
		yourself