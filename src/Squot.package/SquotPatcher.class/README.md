I unpack graphs of object shadows to generate regular object graphs.

If a reference indicates that the hash of the value is significant, the value will only be filled in after it has been fully reactivated. Otherwise the values are filled in as soon as they are materialized (but still empty).

Instance Variables
	availableObjects		<IdentityDictionary> already unpacked objects (or in progress)
	remainingReferences:	<IdentityDictionary> outgoing references not yet filled in
	pendingReferences:	<IdentityDictionary> incoming references to be filled in when the object in the key has been materialized
	pendingReferencesForHash: <IdentityDictionary> incoming references to be filled in when the values have been reactivated (and their hash is settled)