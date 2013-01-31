sending
sendWant: gitSignature
	^ self sendCommand: 'want' arguments: gitSignature withLineTerminator: true