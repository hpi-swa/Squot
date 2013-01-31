receiving
parseUploadPackResponse
	| result firstLine firstSplit capabilities|

	result := Dictionary new.
	
	"the first line is special: after a null character, there is a list of capabilities" 
	firstLine := self readPktLineIfZero: [Error signal: 'The response was not well formed' ].
	firstSplit := Character null split: firstLine.
	
	"e.g., 'multi_ack thin-pack side-band side-band-64k ofs-delta'"
	result at: #capabilities put: (Character space split: firstSplit second).
	
	"e.g., '32f1d219977eff6d466950ddb6e086dc7d5f3f4f HEAD'"
	firstSplit := Character space split: firstSplit first.
	result at: firstSplit second put: firstSplit first.
	
	self readLines: [ :line |
		| parts |
		(line beginsWith: '#') ifFalse: [ 
			parts := Character space split: line.
			result at: parts second put: parts first ]].
	^ result