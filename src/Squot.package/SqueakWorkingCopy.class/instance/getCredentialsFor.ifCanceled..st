credentials
getCredentialsFor: aStringOrUrl ifCanceled: aBlock
	^ self credentials
		at: aStringOrUrl
		ifAbsentPut: [self
						requestCredentialsFor: aStringOrUrl
						ifCanceled: [^ aBlock value]]