commands
writeWantAll: gitSignatures capabilities: capabilities shallowLines: shallowLines depth: depth
	"Ask the server to send all gitSignatures."

	"The capabilities must be attached at the end."
	self writeWant: (self concatenateArguments: gitSignatures first andCapabilities: capabilities).
	2 to: gitSignatures size do: [ :i | self writeWant: (gitSignatures at: i) ].
	shallowLines ifNotNil: [ self writeShallowLines: shallowLines ].
	depth ifNotNil: [ self writeDepth: depth ]