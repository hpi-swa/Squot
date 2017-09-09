Squot-diff-manipulation
privateAdjustToResemble: aDiffNode 
	"child nodes' content are the original associations in slotChanges, see asSquotHierarchicalDiff"
	aDiffNode children do: [:each | | newSlotDiff |
		newSlotDiff := (each content squotAdjustToResemble: each).
		newSlotDiff squotHasChanges
			ifTrue: [slotChanges add: newSlotDiff]
			ifFalse: [slotChanges removeKey: each content key]]