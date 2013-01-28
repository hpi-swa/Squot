as yet unclassified
url: anUrlString
	| url protocol |
	url := anUrlString asUrl.
	protocol := self protocolForScheme: url scheme.
	^ protocol connectTo: url