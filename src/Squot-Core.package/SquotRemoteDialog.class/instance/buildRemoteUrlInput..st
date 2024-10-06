toolbuilder
buildRemoteUrlInput: builder
	^ builder pluggableInputFieldSpec new
		model: self;
		getText: #remoteUrl;
		editText: #remoteUrl:;
		setText: #remoteUrl:;
		help: 'URL (https)';
		yourself