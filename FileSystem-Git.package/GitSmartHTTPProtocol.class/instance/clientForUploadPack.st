private
clientForUploadPack
	^ self clientForPostService: 'git-upload-pack'