tests
testWantAllCapabilitiesMoreThanOne
	| gitSignatures capabilities |
	
	gitSignatures := Array
						with: '003ac70f1e4ab9f7226e908d27b7ed24651527589a6a'
						with: '003a107a203c2b5b5cf25fe759069ea8026a4ad6bcb9'.
	capabilities := GitProtocolCapabilities multiAck thinPack sideBand.
	
	self
		withWriterAssert: [ :writer | writer sendWantAll: gitSignatures capabilities: capabilities shallowLines: nil depth: nil]
		equals: '0054want 003ac70f1e4ab9f7226e908d27b7ed24651527589a6a thin-pack side-band multi_ack', String lf,
				'0036want 003a107a203c2b5b5cf25fe759069ea8026a4ad6bcb9', String lf