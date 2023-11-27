actions
removePackage: aString
	self workingCopy removeMapper: ((self mapperFor: aString) ifNil: [^ self]).