testing
canDecode: aByteArray
	^ (self hasVersion2MagicNumber: aByteArray)
		and: [ self hasVersionNumber2: aByteArray ]