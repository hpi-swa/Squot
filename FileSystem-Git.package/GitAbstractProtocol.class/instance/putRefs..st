git protocol clients
putRefs: aDictionary
	"git push {aDictionary keys [String]}:{aDictionary values [GitStorableObject]}"
	^ self subclassResponsibility