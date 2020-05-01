private
changedRef: aGitReference
	"Update resolved hash for this ref and flush resolved hashes for derived refs, such as symbolic refs or shortened ref names (master instead of refs/heads/master)."
	| refsToFlush null |
	aGitReference isSymbolic ifFalse:
		[resolvedRefs at: aGitReference name put: aGitReference signature].
	refsToFlush := OrderedCollection new: resolvedRefs size.
	null := GitReference zeroRefWithName: 'NULL'.
	resolvedRefs keysDo:
		[:each | | ref | ref := refs associationAt: each ifAbsent: [null].
		(ref exists not or: [ref isSymbolic]) ifTrue: [refsToFlush add: each]].
	refsToFlush do: [:each | resolvedRefs removeKey: each].