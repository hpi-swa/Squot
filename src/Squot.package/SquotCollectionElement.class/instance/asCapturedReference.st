capturing
asCapturedReference
	"Since a captured reference will need to refer to the captured snapshot instead of the live object, make an empty copy."
	^ self copyWithTarget: nil