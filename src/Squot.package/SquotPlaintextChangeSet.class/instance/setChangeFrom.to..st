accessing
setChangeFrom: aString to: anotherString
	self change: (SquotPlaintextNormalChange
					withChangeSet: self
					from: aString
					to: anotherString).