*squot-serializing
squotRewritePath: pathString with: aSquotCypressCodeSerializer
	"double dispatch"
	^ aSquotCypressCodeSerializer rewritePath: pathString ofPackage: self