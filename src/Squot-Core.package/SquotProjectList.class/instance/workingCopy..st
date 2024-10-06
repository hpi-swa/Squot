accessing
workingCopy: aWorkingCopy
	self setWorkingCopySelector ifNil: [^ self].
	self model perform: self setWorkingCopySelector with: aWorkingCopy.