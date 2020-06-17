actions
afterCloseContinueIn: anObject with: unarySelectorSymbol
	promise := Promise new
		whenResolved: [anObject perform: unarySelectorSymbol with: self];
		yourself.