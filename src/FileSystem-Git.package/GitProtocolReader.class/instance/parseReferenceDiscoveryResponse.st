receiving
parseReferenceDiscoveryResponse
	| result firstLine firstSplit|

	result := Dictionary new.
	
	"the first line is special: after a null character, there is a list of capabilities" 
	firstLine := self readPktLineIfZero:
		["Actually this response is invalid since a server must announce its capabilities.
		But GitHub sends 00000000 nevertheless, so we conform to practice instead of the specification."
		result at: #capabilities put: #().
		^ result].
	(firstLine beginsWith: 'ERR ') ifTrue: [GitRemoteError signal: (firstLine allButFirst: 4)].
	firstSplit := firstLine splitBy: Character null asString.
	
	"e.g., 'multi_ack thin-pack side-band side-band-64k ofs-delta'"
	result at: #capabilities put: ((self tryDecodeUtf8: firstSplit second) splitBy: String space).
	
	"e.g., '32f1d219977eff6d466950ddb6e086dc7d5f3f4f HEAD'"
	firstSplit := firstSplit first splitBy: String space.
	result at: (self tryDecodeUtf8: firstSplit second) put: firstSplit first.
	
	self readLines: [ :line |
		| parts |
		(line beginsWith: '#') ifFalse: [ 
			parts := line splitBy: String space.
			result at: (self tryDecodeUtf8: parts second) put: parts first ]].
	^ result