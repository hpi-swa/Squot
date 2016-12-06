commands
writeWant: gitSignature
	^ self writeCommand: 'want' arguments: gitSignature withLineTerminator: true