git protocol clients
putRefs: aDictionary of: aRepository
	"git push {aDictionary keys [String]}:{aDictionary values [GitStorableObject]}"
	^ self subclassResponsibility