commands
uploadPack
	|null|
	null := 0 asCharacter asString.
	writer
		sendCommand: 'git-upload-pack' 
		argument: (self repository, null, self hostInformation, null)
		withLineTerminator: false.
	^ reader parseUploadPackResponse.