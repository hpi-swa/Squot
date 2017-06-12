*Squot-content-diff
squotAbsentContent
	"Answer an instance of my type that can represent an absent object.
	Diffing the answer against me should result in a diff that constructs me completely."
	^ originalClass absentPrototypeForSquot asSquotContent