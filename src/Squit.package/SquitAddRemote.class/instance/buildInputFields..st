toolbuilder
buildInputFields: builder
	^ {
	builder pluggableInputFieldSpec new
		name: 'remoteUrl';
		model: self;
		getText: #remoteUrl;
		editText: #remoteUrl:;
		setText: #remoteUrl:;
		indicateUnacceptedChanges: false;
		help: 'URL of the remote. Only HTTP(S) URLs are supported as of now.'.
	builder pluggableInputFieldSpec new
		name: 'remoteName';
		model: self;
		getText: #remoteName;
		editText: #remoteName:;
		setText: #remoteName:;
		indicateUnacceptedChanges: false;
		help: 'Local name of the remote'.
	}