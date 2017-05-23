history walking
excludeAncestorsOf: aVersion
	self flag: #optimize. "use coloring like for merge-bases?"
	self class new
		startingFrom: aVersion
		do: [:version |
			(sinkVersions includes: version)
				ifTrue: [false]
				ifFalse: [sinkVersions add: version. true]]