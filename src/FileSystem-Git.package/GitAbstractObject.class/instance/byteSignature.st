accessing
byteSignature
	^ GitStream streamContents: [ :stream | self byteSignatureOn: stream ]