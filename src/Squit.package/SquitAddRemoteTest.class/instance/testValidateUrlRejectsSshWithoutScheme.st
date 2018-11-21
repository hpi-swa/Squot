as yet unclassified
testValidateUrlRejectsSshWithoutScheme
	| tool |
	tool := SquitAddRemote new.
	tool remoteUrl: 'git@github.com:hpi-swa/Squot.git'.
	self deny: tool validateUrl.