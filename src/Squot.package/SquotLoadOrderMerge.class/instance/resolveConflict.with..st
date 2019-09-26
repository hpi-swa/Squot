private
resolveConflict: anAssociation with: resolutionBlock
	(containerConflicts detect: [:eachConflict | eachConflict diff3conflict = anAssociation value]
			ifNone: [^ self])
		resolution: resolutionBlock value.