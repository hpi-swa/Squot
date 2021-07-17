Squot-diff-applying
squotApplyToLoaded: anObject
	"Modify anObject such that it matches what I model"
	^ SquotNewObjectPatcher new
		apply: self toLoaded: anObject.