credentials
removeCredentialsFor: aStringOrUrl
	self credentials removeKey: aStringOrUrl ifAbsent: [].