accessing
flush
	| entity data |
	entity := ZnStringEntity type: ZnMimeType applicationGitUploadPackRequest.
	entity string: self outputStream contents.
	
	data := self clientForUploadPackService
				entity: entity;
				post.
	stream := data readStream