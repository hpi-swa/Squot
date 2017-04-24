as yet unclassified
mergeWith: anotherSnapshot basedOn: mergeBaseSnapshot
	| mergeBuilder |
	mergeBuilder := self createNewBuilder.
	self artifactsDo: [:own | | other base |
		other := anotherSnapshot artifactAt: own path ifAbsent: [own absentCopy].
		base := mergeBaseSnapshot artifactAt: own path ifAbsent: [own absentCopy].
		self flag: #optimization. "VC backend could quickly tell if the artifacts are equal"
		mergeBuilder add: (self mergeArtifact: own with: other basedOn: base)].
	^ mergeBuilder buildSnapshot