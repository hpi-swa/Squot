credentials
handleCredentialsDuring: aBlock
	^ self handleCredentialsDuring: aBlock ifCanceled: [nil]