Squot-diff-patching
applyToShadowNamed: name inGraph: anObjectGraph
	"Don't use the name of the old shadow, use the name of the new shadow."
	| new |
	new := self right.
	new hasSquotShadowName
		ifTrue:
			[anObjectGraph assign: new name toShadow: new undecorated.
			anObjectGraph startName = name
				ifTrue: [anObjectGraph startName: new name]].
	^ new