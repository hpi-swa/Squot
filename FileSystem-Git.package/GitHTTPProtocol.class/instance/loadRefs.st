as yet unclassified
loadRefs
	| data |
	self openConnection.
	data := client
		url: self url asString, '/info/refs';
		queryAt: 'service' put: 'git-upload-pack';
		get.
	self flag: 'TODO: use streaming response'.
	stream := data asString readStream.
	^ self parseUploadPackResponse; parseUploadPackResponse
