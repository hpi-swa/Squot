private
withCurrentSnapshot: aSnapshot do: aBlock
	"Assume the current memory snapshot during aBlock"
	^ SquotCurrentWorkingCopySnapshotBlock
		value: [aSnapshot]
		during: aBlock