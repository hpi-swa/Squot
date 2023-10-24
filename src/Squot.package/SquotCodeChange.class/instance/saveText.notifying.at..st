ui
saveText: aText notifying: requestor at: aNumber
	self editedTexts
		ifNil: [
			[self
				editedTexts: (self sourceIndices collect: [:index |
								index = aNumber ifTrue: [aText] ifFalse: [self textAt: index]]);
				lastRequestors: (self sourceIndices collect: [:index |
									index = aNumber ifTrue: [requestor] ifFalse: [nil]]);
				changed: #acceptChanges; "trigger an accept for all text editors, populating editedTexts and lastRequestors"
				saveTexts: (self editedTexts collect: #asString) notifying: self lastRequestors]
					ensure: [self editedTexts: nil; lastRequestors: nil]]
		ifNotNil: [
			self editedTexts at: aNumber put: aText asString.
			self lastRequestors at: aNumber put: requestor].