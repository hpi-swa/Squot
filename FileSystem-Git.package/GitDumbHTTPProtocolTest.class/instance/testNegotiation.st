tests
testNegotiation
	| response |
	self flag: 'Find a url for a dumb http repository. We only found smart ones on the web'.
	response := (GitDumbHTTPProtocol initialRequestTo: 'https://git.gitorious.org/pharo-build/pharo-build.git') response.
	self assert: (GitDumbHTTPProtocol isSmartResponse: response).
