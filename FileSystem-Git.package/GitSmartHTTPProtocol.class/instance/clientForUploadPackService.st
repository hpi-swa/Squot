private
clientForUploadPackService
	^ self client
		url: self url asZnUrl / 'info' / 'refs';
		queryAt: 'service' put: 'git-upload-pack';
		yourself