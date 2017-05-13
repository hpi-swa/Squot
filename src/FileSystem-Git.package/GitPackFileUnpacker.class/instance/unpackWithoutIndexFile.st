operations
unpackWithoutIndexFile
	| reader count |
	reader := self packFile readStream.
	reader reset.
	reader skip: 12. "skip header"
	self packFile readStream: reader.
	
	count := self packFile numberOfObjects.
	'Unpacking Git objects' displayProgressFrom: 0 to: count during: [:progress |
		| done |
		done := 0.
		count timesRepeat: [ | packedObject |
			packedObject := self packFile objectAtOffset: reader position.
			packedObject unpackWith: self.
			progress value: (done := done + 1)]].
	self processDeltas