private
removeArtifactsOutdatedBy: aSnapshot
	(aSnapshot patchRelativeToBase: self)
		paths collect: [:each | self resolve: each]
			thenDo: [:each | (each exists and: [each ~= directory]) ifTrue: [each deleteAll]].