private
restore: currentObject to: anotherVersionOfTheObject
	self flag: #hack. "possibly dangerous!"
	currentObject becomeForward: anotherVersionOfTheObject
