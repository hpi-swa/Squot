commands
writeCommand: aCommandString withLineTerminator: aBoolean
	| command |
	command := aBoolean
					ifTrue:  [ aCommandString , String lf ]
					ifFalse: [ aCommandString ].
	self writeData: (self encodePktLine: command).
	