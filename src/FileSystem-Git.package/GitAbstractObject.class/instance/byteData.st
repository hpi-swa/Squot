accessing
byteData
	^ GitStream streamContents:  [ :stream | self byteDataOn: stream ]