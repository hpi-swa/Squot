legacy
writeInfo: aVersionInfo
	(self reference / 'version') writeStreamDo: [ :s |
		s nextPutAll: (self convert: (self serializeVersionInfo: aVersionInfo)) ]