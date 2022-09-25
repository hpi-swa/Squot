as yet unclassified
objectForDataStream: aReferenceStream
	"Do not write all temporary references out."
	| proxy |
	proxy := DiskProxy global: #SquotObjectRegistry selector: #new args: #().
	aReferenceStream replace: self with: proxy.
	^ proxy