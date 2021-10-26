private
detectStartObjectReplacement: leftStartShadow with: rightStartShadow
	(shadowNames at: leftStartShadow undecorated) ~= (shadowNames at: rightStartShadow undecorated)
		ifTrue:
			["Start objects have different identities."
			| newName |
			newName := shadowNames at: rightStartShadow undecorated.
			objectDiffs at: leftStartShadow undecorated put: (SquotObjectReplacement left: leftStartShadow right: rightStartShadow)].