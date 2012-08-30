instance creation
fromPack: aPack at: anOffset in: aRepository
	| stream typeCode class |
	stream := aPack readStream.
	stream position: anOffset.
	typeCode := self byteTypeCodeFrom: stream.
	class := self types 
		detect: [ :aClass | aClass canDecode: typeCode ]
		ifNone: [ GitInvalidObjectError signal: 'Invalid type code for packed object.' ].
	
	^ class new
		repository: aRepository;
		pack: aPack;
		loadFrom: stream;
		yourself