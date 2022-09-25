*Squot
fromName: aStringOrByteArray inNameSpace: aUUID
	| nameBytes bytes hash newUUID |
	self flag: #todo. "Bytes of the name space UUID must be put in network byte order."
	nameBytes := aStringOrByteArray asByteArray.
	bytes := ByteArray new: aUUID size + nameBytes size.
	bytes replaceFrom: 1 to: aUUID size with: aUUID.
	bytes replaceFrom: aUUID size + 1 to: bytes size with: nameBytes.
	hash := SecureHashAlgorithm new hashMessage: bytes.
	newUUID := UUID basicNew: 16.
	newUUID replaceFrom: 1 to: 16 with: hash startingAt: 1.
	newUUID at: 7 put: (((newUUID at: 7) bitAnd: 2r00001111) bitOr: 2r01010000 "name based with SHA-1 hashing").
	newUUID at: 9 put: (((newUUID at: 9) bitAnd: 2r00111111) bitOr: 2r10000000).
	self flag: #todo. "newUUID must be put in local byte order"
	^ newUUID