initialize-release
initialize
	mirrors := IdentityDictionary new.
	walk := SquotGraphWalk new.
	self flag: #todo. "walk doNotTrackReferrers?."