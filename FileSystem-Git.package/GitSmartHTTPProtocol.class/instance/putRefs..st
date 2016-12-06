git protocol clients
putRefs: aDictionary
	"git push {aDictionary keys [String]}:{aDictionary values [GitStorableObject]}"
	self break.
	self requestCredentials.
	self withOpenConnection: [
		self discoverReferencesForService: 'git-receive-pack';
			invokeReceivePackWithRefs: aDictionary]