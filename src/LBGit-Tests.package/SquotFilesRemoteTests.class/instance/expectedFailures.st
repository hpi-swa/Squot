as yet unclassified
expectedFailures
	self flag: #TODO "Make credentials available".
	[self credentials] 
		on: NeedGitCredentials
		do: [^ super expectedFailures, self class allTestSelectors].
	^ super expectedFailures