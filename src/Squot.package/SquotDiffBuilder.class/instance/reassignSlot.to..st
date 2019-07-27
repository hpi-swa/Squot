as yet unclassified
reassignSlot: leftSlot to: rightSlot
	leftSlot value = rightSlot value
		ifTrue: [^ SquotDiffOfEqualObjects instance].
	self flag: #TODO.
	"Might need subclasses for each slot type to remember the type.
	In that case, let the slots create the reassignment object.
	This would also eliminate the access to their internals below."
	^ SquotSlotReassignment
		key: leftSlot key
		leftShadow: leftSlot value
		rightShadow: rightSlot value