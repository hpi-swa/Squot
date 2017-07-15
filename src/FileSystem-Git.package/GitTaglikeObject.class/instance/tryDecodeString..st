loading
tryDecodeString: aByteString
	[^ (TextConverter newForEncoding: repository configI18nCommitEncoding)
		decodeString: aByteString]
	on: Error do: [^ aByteString].
