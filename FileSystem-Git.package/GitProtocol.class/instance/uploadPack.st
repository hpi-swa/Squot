commands
uploadPack
	|null|
	self openConnection.
	null := 0 asCharacter asString.
	writer
		sendCommand: 'git-upload-pack' 
		arguments: (self repository, null, self hostInformation, null)
		withLineTerminator: false.
	^ reader parseUploadPackResponse.