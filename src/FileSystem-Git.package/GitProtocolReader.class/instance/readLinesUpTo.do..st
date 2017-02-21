private receiving
readLinesUpTo: terminator do: aBlock
	" read input until we get the terminating line"
	[true] whileTrue: [
		|pktLine|
		pktLine := self readPktLineIfZero: [ ^ self ].
		pktLine = terminator ifTrue: [ ^ self ].
		aBlock value: pktLine ]