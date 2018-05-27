repository config
addTo: aGitRepository
	aGitRepository
		remoteConfigFor: self name option: 'url' set: self url asString;
		remoteConfigFor: self name option: 'fetch' set: self fetchSpecs anyOne asString.
	self flag: #stub. "there could be multiple fetch specs"