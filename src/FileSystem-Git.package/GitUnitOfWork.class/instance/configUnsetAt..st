accessing
configUnsetAt: aNameString
	self flag: #stub.
	[repository configUnsetAt: aNameString]
		on: Deprecation do: [:ex | ex resume].
	config := nil. "reload"