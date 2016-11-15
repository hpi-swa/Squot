tests
testNegotiation
	| response |
	self flag: 'Find a url for a dumb http repository. We only found smart ones on the web'.
	response := (GitDumbHTTPProtocol initialRequestTo: 'https://github.com/j4yk/filesystem-git-test-repository.git' with: WebClient).
	self assert: (GitDumbHTTPProtocol isSmartResponse: response).
