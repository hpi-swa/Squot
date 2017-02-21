as yet unclassified
buildUI
	mcChangeSelector := MCChangeSelector forPatch: (proposed patchRelativeToBase: original).
	mcChangeSelector kept addAll: (current patchRelativeToBase: original) operations.
	^ mcChangeSelector window