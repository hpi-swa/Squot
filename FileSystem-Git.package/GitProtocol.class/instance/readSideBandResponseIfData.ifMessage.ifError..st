accessing
readSideBandResponseIfData: dataBlock ifMessage: messageBlock ifError: errorBlock
	^ self 
		readSideBandResponseFrom: self stream 
		ifData: dataBlock 
		ifMessage: messageBlock 
		ifError: errorBlock