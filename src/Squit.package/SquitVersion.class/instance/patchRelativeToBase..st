comparing
patchRelativeToBase: objectContainer
	"Answer a patch that when applied to objectContainer will make our objects equal."
	objectContainer species = self species
		ifTrue: [^ self patchRelativeToBaseVersion: objectContainer].
	^ SquotPatch builder patchFrom: objectContainer to: self