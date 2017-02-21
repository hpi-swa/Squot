legacy
writeLegacySnapshot: aSnapshot
	(self reference / 'source.st')
		writeStreamDo: [ :s | 
			s nextPutAll: (self convert: (self serializeDefinitions: aSnapshot definitions)) ].