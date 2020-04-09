loading
tryDecodeString: aByteString
	[^ (TextConverter newForEncoding: self currentUnitOfWork configI18nCommitEncoding)
		decodeString: aByteString]
	on: Error do: [^ aByteString].
