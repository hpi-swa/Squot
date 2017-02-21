operations-writing
writeFileNames
	| finalHash message name |
	message := (self sortedHashes gather: [ :integer | integer asByteArray ]) asByteArray.
	finalHash := GitHash from: message.
	name := self packFile reference parent / ('pack-', finalHash hexHash).
	self packFile reference moveTo: name, 'pack'.
	self indexFile reference moveTo: name, 'idx'