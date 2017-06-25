accessing
slotShadowType
	self flag: #stub. "this information is currently lost after diffing"
	self key isInteger
		ifTrue: [^ SquotVariablePartSlot]
		ifFalse: [^ SquotInstVarSlot]
	