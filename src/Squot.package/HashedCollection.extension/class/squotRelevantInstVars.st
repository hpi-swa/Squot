*Squot-trackable-capturing
squotRelevantInstVars
	"Exclude instance variables of HashedCollection. The elements are captured in extra slots."
	self == HashedCollection ifTrue: [^ superclass squotRelevantInstVars].
	^ super squotRelevantInstVars