upstream
setUpstreamRemoteNameAndRefFor: aString
	self 
		setUpstreamRemoteNameAndRef:
			((self requestRemoteNameAndRefFor: aString) ifNil: [^ self])
		for: aString.