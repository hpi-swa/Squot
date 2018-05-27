accessing
addDefaultFetchSpec
	^ self addFetchSpecString: '+refs/heads/*:refs/remotes/', self name, '/*'