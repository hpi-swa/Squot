testing
isSmartResponse: initialResponse
	^ initialResponse contentType = 'application/x-git-upload-pack-advertisement'