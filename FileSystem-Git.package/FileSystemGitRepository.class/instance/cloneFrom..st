git porcelain
cloneFrom: aStringOrUrl
	| url |
	url := aStringOrUrl asUrl.
	repository
		configAt: 'remotes.origin.url' put: aStringOrUrl;
		configAt: 'remotes.origin.fetch' put: '+refs/heads/*:refs/remotes/origin/*'.
	self fetchFrom: 'origin'.