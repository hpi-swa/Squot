private
privateResolvedPatch
	| modifiedWorking mirror |
	choice = #working ifTrue: [^ SquotDiffOfEqualObjects instance].
	"Compare with a patched version of the working copy object, but only with the modifications remaining that were not removed."
	modifiedWorking := working copy.
	mirror := (modifiedWorking flag: #stub; class) squotMirror.
	containerModifications do: [:each | each applyTo: modifiedWorking].
	containerConflicts do: [:each | each resolution squotReflectOn: modifiedWorking in: mirror].
	^ working squotDiffAgainst: modifiedWorking