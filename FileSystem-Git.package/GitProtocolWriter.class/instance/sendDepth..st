sending
sendDepth: depth
	^ self sendCommand: 'deepen' arguments: depth asString withLineTerminator: true