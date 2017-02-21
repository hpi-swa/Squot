tests
testNegotiation
	| response protocol |
	self flag: 'Find a url for a dumb http repository. We only found smart ones on the web'.
	response := ((protocol := self newProtocol) initialRequestTo: 'https://github.com/j4yk/filesystem-git-test-repository.git' withService: 'git-upload-pack').
	self assert: (protocol isSmartResponse: response).
