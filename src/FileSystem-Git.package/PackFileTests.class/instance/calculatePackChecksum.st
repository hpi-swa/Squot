helpers
calculatePackChecksum
	| position packData |
	position := packReader position.
	self assert: (packReader skip: 20; atEnd).
	
	packReader position: 0.
	packData := packReader next: position.
	packReader position: position.
	
	^ GitHash from: packData