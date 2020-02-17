private
headerOfObjectNamed: aHash
	^ self
		headerOfObjectNamed: aHash
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: aHash printString, ' not found'
				with: aHash]