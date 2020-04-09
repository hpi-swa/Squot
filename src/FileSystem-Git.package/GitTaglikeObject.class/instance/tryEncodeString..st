loading
tryEncodeString: aByteString
	[^ (TextConverter newForEncoding: self currentUnitOfWork configI18nCommitEncoding)
		encodeString: aByteString]
	on: Error do: [^ aByteString].
