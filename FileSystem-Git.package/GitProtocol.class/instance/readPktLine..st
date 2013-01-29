private
readPktLine: aStream
	^ self readPktLine: aStream ifZero: [Error signal: 'Special case 0000 encountered.' ]