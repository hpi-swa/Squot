accessing
version: anObject
	self setVersionSelector ifNil: [^ self].
	self model perform: self setVersionSelector with: anObject.