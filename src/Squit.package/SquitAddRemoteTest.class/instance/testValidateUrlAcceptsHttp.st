as yet unclassified
testValidateUrlAcceptsHttp
	| tool |
	tool := SquitAddRemote new.
	tool remoteUrl: 'http://github.com/hpi-swa/Squot.git'.
	self assert: tool validateUrl.