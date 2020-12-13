private
privateResolvedPatch
	^ SquotTrackedObjectMetadataDiff left: working right: incoming diffs: containerModifications, (containerConflicts collect: [:each | each resolution])