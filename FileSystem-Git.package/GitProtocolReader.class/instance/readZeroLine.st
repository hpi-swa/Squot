private receiving
readZeroLine
	self readPktLineIfZero: [ ^ self ].
	Error signal: 'Expected 0000'