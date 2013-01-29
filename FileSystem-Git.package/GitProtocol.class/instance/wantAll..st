as yet unclassified
wantAll: gitSignatures 
	^ self 
		wantAll: gitSignatures 
		properties: GitProtocolCapabilities multiAck sideBand64k ofsDelta