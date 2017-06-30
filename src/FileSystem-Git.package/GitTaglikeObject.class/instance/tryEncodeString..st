loading
tryEncodeString: aByteString
	[^ (TextConverter newForEncoding: repository configI18nCommitEncoding)
		encodeString: aByteString]
	on: Error do: [^ aByteString].
