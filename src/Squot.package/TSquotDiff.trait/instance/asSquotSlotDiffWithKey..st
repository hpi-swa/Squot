Squot-diff-converting
asSquotSlotDiffWithKey: aKey
	"Answer a SquotSlotDiff or one of the appropriate subclasses to describe the operation on a SquotObjectShadow's slot should I be applied to its value."
	^ SquotSlotDiff key: aKey value: self