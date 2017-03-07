instance creation
headerFromPack: aPack at: anOffset in: aRepository
	| stream typeCode class packedObject |
	stream := aPack readStream.
	stream position: anOffset.
	typeCode := self byteTypeCodeFrom: stream.
	class := self decodeClassFrom: typeCode.
	
	packedObject := class new
		repository: aRepository;
		pack: aPack;
		loadHeaderFrom: stream;
		yourself.
	^ GitStorableObjectHeader
		typeCode: packedObject typeCode
		size: packedObject unpackedLength