private receiving
readPktLine
	^ self readPktLineIfZero: [ Error signal: 'Special case 0000 encountered.' ]