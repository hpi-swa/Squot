git protocol clients
putRefs: aDictionary of: aRepository
	"git push {aDictionary keys [String]}:{aDictionary values [GitStorableObject]}"
	"note that pushing via the git:// protocol is typically disallowed for the lack of authentication"
	| null serverRefsBeforeUpdate |
	self openConnection.
	null := Character null asString.
	writer
		writeCommand: 'git-receive-pack' 
		arguments: (self repository, null, self hostInformation, null)
		withLineTerminator: false.
	self flush.
	serverRefsBeforeUpdate := reader parseReferenceDiscoveryResponse.