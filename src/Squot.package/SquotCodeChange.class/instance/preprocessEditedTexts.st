ui
preprocessEditedTexts
	| texts |
	texts := self editedTexts collect: #asString.
	self fillCurrentTimeStamps: texts.
	^ texts