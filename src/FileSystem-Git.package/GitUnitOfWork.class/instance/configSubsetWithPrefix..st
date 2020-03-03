accessing
configSubsetWithPrefix: aString
	self flag: #stub.
	^ [repository configSubsetWithPrefix: aString]
		on: Deprecation do: [:ex | ex resume]