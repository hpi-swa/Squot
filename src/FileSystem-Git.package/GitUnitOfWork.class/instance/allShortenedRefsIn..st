refs
allShortenedRefsIn: aString
	"Answer a collection of ref names that start with the given prefix, with the prefix removed from each ref."
	| names prefix prefixLength |
	prefix := aString, '/'. "do not split ref parts (e. g. don't enumerate refs/headsx as x)"
	prefixLength := prefix size.
	names := OrderedCollection new.
	self allReferencesPrefixedWith: prefix do:
		[:each | | name |
		name := each allButFirst: prefixLength.
		names add: name].
	^ names