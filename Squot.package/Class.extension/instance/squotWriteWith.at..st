*Squot-serialization
squotWriteWith: aSerializer at: aPath
	"double dispatch"
	aSerializer writeClass: self at: aPath.