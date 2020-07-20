configuration
configSubkeysAt: aString
	self flag: #stub.
	^ [repository configSubkeysAt: aString]
		on: Deprecation do: [:ex | ex resume]