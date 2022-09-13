instance creation
fromPack: aPack at: anOffset in: aRepository hash: aHash
	| stream typeCode class |
	stream := aPack readStream.
	stream position: anOffset.
	typeCode := self byteTypeCodeFrom: stream.
	class := self decodeClassFrom: typeCode.
	
	^ class new
		setRepository: aRepository
		pack: aPack
		hash: aHash;
		loadFrom: stream;
		yourself