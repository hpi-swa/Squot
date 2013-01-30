sending
sendCommand: aCommandString withLineTerminator: aBoolean
	| command |
	command := aBoolean
					ifTrue:  [ aCommandString , String lf ]
					ifFalse: [ aCommandString ].
	self sendData: (self encodePktLine: command).
	