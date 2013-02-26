testing
isSmartResponse: initialResponse
	^ initialResponse contentType
		matches: ZnMimeType applicationGitUploadPackAdvertisement