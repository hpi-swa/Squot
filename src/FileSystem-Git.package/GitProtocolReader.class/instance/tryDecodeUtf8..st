private receiving
tryDecodeUtf8: aByteString
	^ [UTF8TextConverter decodeByteString: aByteString]
		on: Error do:
			[:e | e return: aByteString "leave undecoded"]