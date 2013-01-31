tests
testWantAllCapabilitiesWithAllOptions
	| gitSignatures capabilities shallowLines depth |
	
	gitSignatures := Array with: '003ac70f1e4ab9f7226e908d27b7ed24651527589a6a'.
	capabilities := GitProtocolCapabilities multiAck thinPack sideBand.
	shallowLines := Array with: '003ac70f1e4ab9f7226e908d27b7ed24651527589a6a'.
	depth := 2.
	self
		withWriterAssert: [ :writer |
				writer
					sendWantAll: gitSignatures
					capabilities: capabilities
					shallowLines: shallowLines
					depth: depth ]
		equals: '0054want 003ac70f1e4ab9f7226e908d27b7ed24651527589a6a multi_ack thin-pack side-band', String lf,
				'0039shallow 003ac70f1e4ab9f7226e908d27b7ed24651527589a6a', String lf,
				'000ddeepen 2', String lf