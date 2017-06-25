*Squot-diff-applying
squotApplyToLoaded: anObject
	"Modify anObject such that it matches what I model"
	^ SquotObjectPatcher new
		apply: self toLoaded: anObject