*Squot-materializing
squotMaterializeWith: aMaterializer
	MCPackageLoader installSnapshot: self.
	^ ((self definitions collect: #actualClass) detect: #notNil ifNone: [^ nil]) package