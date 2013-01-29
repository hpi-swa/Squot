accessing
readSideBandResponseFrom: aStream ifData: dataBlock ifMessage: messageBlock ifError: errorBlock
	^ self 
		readSideBandResponseFrom: aStream 
		ifData: dataBlock 
		ifMessage: messageBlock 
		ifError: errorBlock 
		ifZero: [ Error signal: 'unexpted 0000 "flush-pkt" encountered ' ]