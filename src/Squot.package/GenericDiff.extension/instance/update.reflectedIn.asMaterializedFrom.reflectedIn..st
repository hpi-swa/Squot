*Squot-diff-patching
update: anObject reflectedIn: aMirror asMaterializedFrom: aShadow reflectedIn: aShadowMirror
	"If I know how to mutate my target object _except_ for changing its outgoing references, I shall do so here. Most diffs will only update references, which must not be done in this method!"
	^ self squotApplyToLoaded: anObject