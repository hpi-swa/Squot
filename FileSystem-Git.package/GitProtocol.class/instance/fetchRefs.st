commands
fetchRefs
	| null |
	self openConnection.
	null := Character null asString.
	writer
		sendCommand: 'git-upload-pack' 
		arguments: (self repository, null, self hostInformation, null)
		withLineTerminator: false.
	refs := reader parseUploadPackResponse.
	^ refs