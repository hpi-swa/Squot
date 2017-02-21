*Squot-serialization
squotRewritePath: pathString with: aSerializer
	"double dispatch"
	^ aSerializer rewritePath: pathString ofClass: self