remotes
addRemote: name url: anUrl
	repository
		configAt: (repository remoteConfigNameFor: name option: 'url') put: anUrl;
		configAt: (repository remoteConfigNameFor: name option: 'fetch') put: '+refs/heads/*:refs/remotes/', name, '/*'.