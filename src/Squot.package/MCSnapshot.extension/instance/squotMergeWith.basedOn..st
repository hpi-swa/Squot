*Squot-merging
squotMergeWith: aMCSnapshot basedOn: aSquotArtifact
	| merger |
	[merger := MCThreeWayMerger 
				base: self
				target: aMCSnapshot
				ancestor: (aSquotArtifact contentOfSameTypeAs: self)]
		on: MCNoChangesException do: [:e | e resume].
	merger isMerged ifFalse:
		[((MCMergeResolutionRequest new merger: merger) signal: 'Preparing merge')
			ifFalse: [self error: 'There is no different means to resolve conflicts yet.']].
	^ merger mergedSnapshot