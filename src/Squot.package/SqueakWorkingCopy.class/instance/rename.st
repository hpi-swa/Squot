accessing
rename
	self name: ((self class requestUnregisteredNameFrom: self name) ifNil: [^ self]).