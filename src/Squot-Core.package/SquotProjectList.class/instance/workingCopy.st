accessing
workingCopy
	self getWorkingCopySelector ifNil: [^ nil].
	^ self model perform: self getWorkingCopySelector