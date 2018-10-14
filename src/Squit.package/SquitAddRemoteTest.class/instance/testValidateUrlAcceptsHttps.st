as yet unclassified
testValidateUrlAcceptsHttps
	| tool |
	tool := SquitAddRemote new.
	tool remoteUrl: 'https://github.com/hpi-swa/Squot.git'.
	self assert: tool validateUrl.