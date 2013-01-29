accessing
readSideBandResponseIfData: dataBlock ifMessage: messageBlock ifError: errorBlock ifZero: zeroBlock
	^ self 
		readSideBandResponseFrom: self stream 
		ifData: dataBlock 
		ifMessage: messageBlock 
		ifError: errorBlock
		ifZero: zeroBlock