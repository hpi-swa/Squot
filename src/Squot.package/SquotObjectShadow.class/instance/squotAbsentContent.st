Squot-shadow-diffing
squotAbsentContent
	"Answer an instance of my type that can represent an absent object.
	Diffing the answer against me should result in a diff that constructs me completely."
	self isThisEverCalled.
	^ originalClass absentPrototypeForSquot captureWithSquot