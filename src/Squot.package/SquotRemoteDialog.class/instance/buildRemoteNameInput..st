toolbuilder
buildRemoteNameInput: builder
	^ builder pluggableInputFieldSpec new
		model: self;
		getText: #remoteName;
		editText: #remoteName:;
		setText: #remoteName:;
		help: 'name';
		yourself