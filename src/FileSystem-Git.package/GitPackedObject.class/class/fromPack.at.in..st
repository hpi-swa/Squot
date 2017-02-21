instance creation
fromPack: aPack at: anOffset in: aRepository
	| stream typeCode class |
	stream := aPack readStream.
	stream position: anOffset.
	typeCode := self byteTypeCodeFrom: stream.
	class := self decodeClassFrom: typeCode.
	
	^ class new
		repository: aRepository;
		pack: aPack;
		loadFrom: stream;
		yourself