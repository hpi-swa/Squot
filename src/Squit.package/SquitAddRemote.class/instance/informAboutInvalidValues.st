validating
informAboutInvalidValues
	self validateUrl ifFalse:
		[^ self inform: 'URL is not vailid: only HTTP(S) URLs are supported as of now.'].
	self validateRemoteName ifFalse:
		[^ self inform: 'Invalid remote name'].