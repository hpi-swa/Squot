validating
informAboutInvalidValues
	self validateUrl ifFalse:
		[^ UIManager default inform: 'URL is not vailid: only HTTP(S) URLs are supported as of now.'].
	self validateRemoteName ifFalse:
		[^ UIManager default inform: 'Invalid remote name'].