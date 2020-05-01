I am a partial view of the ref database of a git repository during a unit of work. Refs from multiple stores (loose refs, packed-refs) are combined in me and the stores may contain more refs than I contain at any time. I do not do any lookups in a ref store, the unit of work must do that.

Collaborators: GitReference.
Clients: GitUnitOfWork.

Instance Variables
	refs:		<Dictionary> Cache of GitReferences. Missing refs will be added with the zeroSignature, to remember that the ref is not in any store.
	resolvedRefs:		<Dictionary> Cache of hashes to which any refs were resolved, including symbolic refs (HEAD) and shortened refs ("master" instead of "refs/heads/master"). Unresolved refs will be added with the zeroSignature.