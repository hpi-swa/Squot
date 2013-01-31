commands
wantAll: gitSignatures 
	^ self 
		wantAll: gitSignatures 
		capabilities: GitProtocolCapabilities multiAck sideBand64k ofsDelta