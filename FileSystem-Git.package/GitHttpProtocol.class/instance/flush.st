as yet unclassified
flush
	| entity data |
	entity := ZnStringEntity type: (ZnMimeType main: 'application' sub: 'x-git-upload-pack-request').
	entity string: self outputStream contents.
	
	data := client
		url: self url asString, '/git-upload-pack' ;
		queryAt: 'service' put: 'git-upload-pack';
		entity: entity;
		post;
		response.
	stream := data readStream