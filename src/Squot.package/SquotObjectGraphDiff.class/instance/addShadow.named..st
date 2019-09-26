initialize-release
addShadow: aShadow named: aName
	shadows at: aName put: aShadow.
	diffs at: aName put: (SquotObjectAddition of: aShadow).