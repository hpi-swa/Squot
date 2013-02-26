connection
initialRequestTo: aUrl
	^ ZnClient new
		url: aUrl asZnUrl / 'info' / 'refs';
		queryAt: 'service' put: 'git-upload-pack';
		"username: 'admin' password: 'admin';"
		enforceHttpSuccess: true;
		streaming: true;
		get;
		yourself