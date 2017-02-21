commands
writeDepth: depth
	^ self writeCommand: 'deepen' arguments: depth asString withLineTerminator: true