private
applyReferenceDiff: aReferenceDiff to: anObject reflectedIn: aMirror new: newShadow reflectedIn: newShadowMirror old: oldShadow reflectedIn: oldShadowMirror from: aGraphDiff ifDeferred: deferredBlock nextDiffsDo: walkBlock
	| valueShadow |
	valueShadow := aReferenceDiff squotValueShadowFrom: oldShadow reflectedIn: oldShadowMirror.
	self applying: aReferenceDiff
		fill: valueShadow reachedVia: aReferenceDiff reference
		into: anObject reflectedIn: aMirror
		ifDeferredUntilActivated: [deferredBlock value]
		ifNotTreatedYet:
			["Could be new or just not yet patched."
			| value isNew valueMirror valueShadowMirror valueName valueDiff |
			valueShadowMirror := newShadowMirror mirrorOf: valueShadow undecorated reachedVia: aReferenceDiff reference from: newShadow undecorated.
			isNew := false.
			value := self findOrCreateMaterializedInstanceOf: valueShadow reflectedIn: valueShadowMirror ifNew: [:newValue | isNew := true].
			"To update a reference might entail to materialize new objects. Filling in of their references must be queued as well."
			valueMirror := aMirror mirrorOf: value reachedVia: aReferenceDiff reference from: anObject.
			valueName := aGraphDiff right nameOf: valueShadow undecorated ifAbsent: [].
			valueDiff := aGraphDiff diffForObjectNamed: valueName ifAbsent: [].
			isNew & valueDiff isNil
				ifTrue: [valueDiff := SquotObjectAddition of: valueShadow].
			valueDiff
				ifNil: [aReferenceDiff squotReflectOn: anObject in: aMirror withValue: value]
				ifNotNil:
					[| oldValueShadow |
					oldValueShadow := (valueName ifNil: [valueShadow] ifNotNil: [aGraphDiff left shadowNamed: valueName ifAbsent: [valueShadow]])  undecorated.
					walkBlock valueWithArguments: {valueDiff. value. valueMirror. valueShadow. valueShadowMirror. oldValueShadow}.
					deferredBlock value]].