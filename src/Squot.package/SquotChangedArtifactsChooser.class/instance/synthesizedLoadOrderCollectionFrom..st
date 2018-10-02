private
synthesizedLoadOrderCollectionFrom: chunksAndSnippetsCollection
	| maxIndex |
	chunksAndSnippetsCollection ifEmpty: [^ Array empty].
	maxIndex := (chunksAndSnippetsCollection collect: [:each | each maxIndex]) max.
	^ RunArray new: maxIndex. "assuming sparse occupancy"