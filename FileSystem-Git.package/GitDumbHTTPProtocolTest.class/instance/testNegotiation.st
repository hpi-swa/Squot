as yet unclassified
testNegotiation
	self flag: 'Find a url for a dumb http repository. We only found smart ones on the web'.
	self assert: (GitDumbHTTPProtocol isSmartRepository: 'https://git.gitorious.org/pharo-build/pharo-build.git').
