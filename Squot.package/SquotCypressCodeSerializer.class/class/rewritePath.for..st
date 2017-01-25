as yet unclassified
rewritePath: pathString for: anObject
	"Append package and class directory if necessary."
	^ anObject squotRewritePath: pathString with: self "double dispatch"