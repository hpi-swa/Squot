private
privateResolvedPatch
	self flag: #todo. "Should become deprecated with SquotToggles useNewApi = true. Replace all patches/diffs with merges and allow merges to be applied directly."
	^ self subclassResponsibility