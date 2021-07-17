initialize-release
initialize
	treatedObjects := IdentityDictionary new.
	pendingIncomingReferences := IdentityDictionary new.
	pendingIncomingReferencesForHash := IdentityDictionary new.
	pendingOutgoingReferences := IdentityDictionary new.
	objectRegistry := SquotObjectRegistry new.