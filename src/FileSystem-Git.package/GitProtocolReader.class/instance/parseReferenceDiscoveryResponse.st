receiving
parseReferenceDiscoveryResponse
	| result firstLine firstSplit|

	result := Dictionary new.
	
	"the first line is special: after a null character, there is a list of capabilities" 
	firstLine := self readPktLineIfZero: [Error signal: 'The response was not well formed' ].
	(firstLine beginsWith: 'ERR ') ifTrue: [Error signal: (firstLine allButFirst: 4)].
	firstSplit := firstLine splitBy: Character null asString.
	
	"e.g., 'multi_ack thin-pack side-band side-band-64k ofs-delta'"
	result at: #capabilities put: (firstSplit second splitBy: String space).
	
	"e.g., '32f1d219977eff6d466950ddb6e086dc7d5f3f4f HEAD'"
	firstSplit := firstSplit first splitBy: String space.
	result at: firstSplit second put: firstSplit first.
	
	self readLines: [ :line |
		| parts |
		(line beginsWith: '#') ifFalse: [ 
			parts := line splitBy: String space.
			result at: parts second put: parts first ]].
	^ result