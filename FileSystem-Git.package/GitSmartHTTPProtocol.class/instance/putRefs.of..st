git protocol clients
putRefs: aDictionary of: aRepository
	"git push {aDictionary keys [String]}:{aDictionary values [GitStorableObject]}"
	| packFile |
	self requestCredentials.
	self withOpenConnection: [
		self discoverReferencesForService: 'git-receive-pack'.
		(aDictionary values anySatisfy: #notNil)
			ifTrue: [packFile := self preparePackFileToPushRefs: aDictionary of: aRepository]
			ifFalse: [packFile := nil].
		self invokeReceivePackWithRefs: aDictionary andPack: packFile]