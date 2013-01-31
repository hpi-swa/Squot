sending
sendWantAll: gitSignatures capabilities: capabilities
	"Ask the server to send all gitSignatures."

	"Send first of gitSignatures and attach the capabilities at the end."
	self
		sendCommand: 'want'
		arguments: (self concatenateArguments: gitSignatures first andCapabilities: capabilities)
		withLineTerminator: true.
		
	"Send other gitSignatures"
	2 to: gitSignatures size do: [ :i | self sendCommand: 'want' arguments: (gitSignatures at: i) withLineTerminator: true ]