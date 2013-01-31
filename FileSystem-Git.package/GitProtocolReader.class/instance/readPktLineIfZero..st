private receiving
readPktLineIfZero: aBlock
	" A PktLine consist of a 4 byte line length and data.
	The encoded length also includes the 4 bytes, hence the shortest sequence is 0004 denoting the empty line.
	Example:
		pkt line   contents
		0004       ''
		0007foo    'foo'
	
	The special 4-bytes 0000 triggers aBlock."
		
	| totalLineLength |
	totalLineLength := self readLineLength.
	^ totalLineLength = 0
		ifTrue: aBlock 
		ifFalse: [ | content |
			content := (self readContentOfLength: totalLineLength) asString.
			"Server SHOULD terminate each non-flush line using LF (\n) terminator;
			client MUST NOT complain if there is no terminator."
			(content isEmpty or: [ content last ~= Character lf])
				ifTrue: [ content ]
				ifFalse: [ content allButLast ]]
				