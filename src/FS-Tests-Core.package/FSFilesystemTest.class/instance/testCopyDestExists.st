tests
testCopyDestExists
	| out |
	
	[out := (filesystem open: 'gooly' writable: true) writeStream.
	[out nextPutAll: 'gooly'] ensure: [out close].
	out := filesystem open: 'plonk' writable: true.
	out close.
	self 
		should: [filesystem copy: 'gooly' to: 'plonk']
		raise: FSFileExists] 
			ensure: [filesystem delete: 'gooly'; delete: 'plonk']