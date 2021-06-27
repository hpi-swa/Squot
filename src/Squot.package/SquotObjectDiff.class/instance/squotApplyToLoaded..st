Squot-diff-applying
squotApplyToLoaded: anObject
	"Modify anObject such that it matches what I model"
	^ self patcherClass new
		apply: self toLoaded: anObject