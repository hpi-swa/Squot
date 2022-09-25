private
privateResolvedPatch
	| modifiedWorking mirror |
	choice = #working ifTrue: [^ SquotDiffOfEqualObjects instance].
	"Compare with a patched version of the working copy object, but only with the modifications remaining that were not removed."
	modifiedWorking := working copy.
	mirror := (modifiedWorking flag: #stub; class) squotMirror.
	containerModifications do: [:each | each asSlotDiff applyTo: modifiedWorking].
	self flag: #todo. "Should not rely on old classes (slot diffs)"
	containerConflicts do: [:each | each resolution squotReflectOn: modifiedWorking in: mirror].
	^ working squotDiffAgainst: modifiedWorking