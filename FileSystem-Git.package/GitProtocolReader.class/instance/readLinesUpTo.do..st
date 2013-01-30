private receiving
readLinesUpTo: terminator do: aBlock
	" read input until we get the terminating line"
	self isThisEverCalled.
	[true] whileTrue: [
		|pktLine|
		pktLine := self readPktLine: self stream ifZero: [ ^ self ].
		pktLine = terminator ifTrue: [ ^ self ].
		aBlock value: pktLine ]