*Squot-trackable
squotRewritePath: pathString with: aSquotCypressCodeSerializer
	"double dispatch"
	^ aSquotCypressCodeSerializer rewritePath: pathString ofPackage: self