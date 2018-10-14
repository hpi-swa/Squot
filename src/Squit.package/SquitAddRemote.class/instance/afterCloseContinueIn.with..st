actions
afterCloseContinueIn: anObject with: unarySelectorSymbol
	self when: #closed send: unarySelectorSymbol to: anObject with: self.