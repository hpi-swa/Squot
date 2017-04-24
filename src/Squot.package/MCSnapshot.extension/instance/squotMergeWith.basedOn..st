*Squot-merging
squotMergeWith: aMCSnapshot basedOn: aSquotArtifact
	| merger |
	[merger := MCThreeWayMerger 
				base: self
				target: aMCSnapshot
				ancestor: (aSquotArtifact contentOfSameTypeAs: self)]
		on: MCNoChangesException do: [:e | e resume].
	merger isMerged
		ifTrue: [^ merger mergedSnapshot]
		ifFalse: [self notYetImplemented. "Deal with conflicts"]