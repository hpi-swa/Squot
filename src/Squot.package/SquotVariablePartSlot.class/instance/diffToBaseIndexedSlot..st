comparing
diffToBaseIndexedSlot: aVariablePartSlot
	self flag: #duplication. "SquotInstVarSlot>>#diffToBaseInstVar:"
	aVariablePartSlot value = self value ifTrue: [^ SquotDiffOfEqualObjects instance].
	self flag: #todo.
	"Might need subclasses for each slot type to remember the type.
	In that case, let the slots create the reassignment object.
	This would also eliminate the access to their internals below."
	^ SquotSlotReassignment
		key: aVariablePartSlot key
		leftShadow: aVariablePartSlot value
		rightShadow: self value