private
resolveConflict: anAssociation with: resolutionBlock
	(conflicts detect: [:eachConflict | eachConflict diff3conflict = anAssociation value]
			ifNone: [^ self])
		resolution: resolutionBlock value.