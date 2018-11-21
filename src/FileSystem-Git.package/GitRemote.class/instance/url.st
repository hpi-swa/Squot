accessing
url
	url ifNil:
		[repository ifNil: [^ url].
		url := repository remoteConfigFor: self name option: 'url'].
	^ url