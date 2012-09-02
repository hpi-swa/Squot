processing
unpack
	| baseOffset base interpreter |
	baseOffset := self readBaseObjectOffset.
	interpreter := self loadDeltaInterpreter.
	base := self pack objectAtOffset: headerPos - baseOffset.
	self runDeltaInterpreter: interpreter against: base