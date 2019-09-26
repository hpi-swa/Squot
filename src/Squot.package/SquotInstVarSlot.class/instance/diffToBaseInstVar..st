comparing
diffToBaseInstVar: baseInstVarSlot
	baseInstVarSlot value = self value ifTrue: [^ SquotDiffOfEqualObjects instance].
	self flag: #todo.
	"Might need subclasses for each slot type to remember the type.
	In that case, let the slots create the reassignment object.
	This would also eliminate the access to their internals below."
	^ SquotSlotReassignment
		key: baseInstVarSlot key
		leftShadow: baseInstVarSlot value
		rightShadow: self value