tests
testWantAllCapabilitiesOnlyOne
	| gitSignatures capabilities |
	
	gitSignatures := Array with: '003ac70f1e4ab9f7226e908d27b7ed24651527589a6a'.
	capabilities := GitProtocolCapabilities multiAck thinPack sideBand.
	
	self
		withWriterAssert: [ :writer | writer sendWantAll: gitSignatures capabilities: capabilities ]
		equals: '0054want 003ac70f1e4ab9f7226e908d27b7ed24651527589a6a multi_ack thin-pack side-band', String lf