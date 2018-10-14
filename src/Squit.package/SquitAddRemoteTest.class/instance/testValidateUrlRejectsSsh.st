as yet unclassified
testValidateUrlRejectsSsh
	| tool |
	tool := SquitAddRemote new.
	tool remoteUrl: 'ssh://git@github.com:hpi-swa/Squot.git'.
	self deny: tool validateUrl.