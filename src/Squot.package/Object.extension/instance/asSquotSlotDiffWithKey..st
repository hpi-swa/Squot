*Squot-shadow-diffing
asSquotSlotDiffWithKey: aKey
	"Answer a SquotSlotDiff with the given key and me as the diff.
	Redefine this if your diff type implies another type of slot change, for example a replacement of the slot value instead of patching the slot value."
	^ SquotSlotDiff key: aKey value: self