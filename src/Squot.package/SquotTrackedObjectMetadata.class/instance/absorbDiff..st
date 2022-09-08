patching
absorbDiff: aTrackedObjectMetadataDiff
	"As metadata with transient properties included, apply the diff, but keep the transient properties."
	"The thorough thing to do would be to admit that the 'left' side of the diff is not equal to me, and to merge me with the 'right' side of the diff, with the 'left' side as the common base. But this would be yet another compare-and-merge operation when new versions are loaded."
	| patched |
	patched := aTrackedObjectMetadataDiff squotApplyTo: self. "This is not completely clean, because the 'left' side of the diff usually does not have my transient properties."
	self updateFrom: patched.
	"In addition, also remove properties that are explictly removed according to the diff."
	(self keys copyWithoutAll: patched keys) do: [:eachKey | self removeKey: eachKey].