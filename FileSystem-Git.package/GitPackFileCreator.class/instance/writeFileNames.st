operations-writing
writeFileNames
	| finalHash message |
	message := (self hashes asSortedCollection gather: [ :integer | integer asByteArray ]) asByteArray.
	finalHash := SecureHashAlgorithm new hashMessage: message.
	self packFile reference moveTo: self packFile reference parent / ('pack-', finalHash asHexHash), 'pack'