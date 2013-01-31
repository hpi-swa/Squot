sending
sendWantAll: gitSignatures capabilities: capabilities shallowLines: shallowLines depth: depth
	"Ask the server to send all gitSignatures."

	"The capabilities must be attached at the end."
	self sendWant: (self concatenateArguments: gitSignatures first andCapabilities: capabilities).
	2 to: gitSignatures size do: [ :i | self sendWant: (gitSignatures at: i) ].
	shallowLines ifNotNil: [ self sendShallowLines: shallowLines ].
	depth ifNotNil: [ self sendDepth: depth ]