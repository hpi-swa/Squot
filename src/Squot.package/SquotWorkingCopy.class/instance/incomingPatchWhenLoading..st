private
incomingPatchWhenLoading: aVersion
	| builder |
	builder := SquotPatch builder.
	builder startingFrom: self currentSnapshot goingTo: (aVersion ifNil: [SquotSnapshot empty]).
	(((unloadedArtifacts select: [:each | each isLoadable])
		reject: [:each | builder includesDiffAt: each path])
		collect: [:each | self artifactAt: each path])
		do: [:each | | load |
			load := SquotArtifactLoad of: each.
			builder addDiff: load.
			load toggleWhetherToLoad].
	^ builder buildPatch