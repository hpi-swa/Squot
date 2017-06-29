private
logMessage: aString
	| loggedMessage |
	loggedMessage := String streamContents: [:msg |
		msg nextPutAll: aString; cr;
			nextPutAll: repository workingDir pathString; cr;
			nextPutAll: 'ModificationManager'].
	GitStore logMessage: loggedMessage.