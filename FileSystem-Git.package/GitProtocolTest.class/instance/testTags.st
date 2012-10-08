tests
testTags
	| protocol tags |
	protocol := AbstractGitProtocol url: 'git://github.com/github/github-services.git'.
	tags := protocol tags.
	self deny: tags isEmpty.