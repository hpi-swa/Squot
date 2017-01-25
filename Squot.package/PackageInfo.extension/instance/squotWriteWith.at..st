*squot-serializing
squotWriteWith: aSquotCypressCodeSerializer at: aString
	"double dispatch"
	aSquotCypressCodeSerializer writePackage: self at: aString