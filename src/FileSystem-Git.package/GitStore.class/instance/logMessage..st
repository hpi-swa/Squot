private
logMessage: aString
	| loggedMessage |
	loggedMessage := String streamContents: [:msg |
		msg nextPutAll: aString; cr;
			nextPutAll: repository workingDir pathString; cr.
		self hash printOn: msg base: 16].
	self class logMessage: loggedMessage.