as yet unclassified
flush
	| entity data |
	entity := ZnStringEntity type: ZnMimeType applicationGitUploadPackRequest.
	entity string: self outputStream contents.
	
	data := self client
		url: self url asString, '/info/refs' ;
		queryAt: 'service' put: 'git-upload-pack';
		entity: entity;
		post.
	stream := data readStream