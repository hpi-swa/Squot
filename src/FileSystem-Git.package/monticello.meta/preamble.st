(PackageInfo named: 'FileSystem-Git') preamble: '"code to be run before the loading of this package"
modes := Smalltalk globals at: #TEMP_GitTreeEntryModes put: IdentityDictionary new.
Smalltalk globals at: #GitTreeEntry ifPresent: [:GitTreeEntry |
	GitTreeEntry allInstancesDo: [:each | | dict |
		dict := Dictionary new.
		dict at: #isInFileMode put: each isInFileMode.
		(each respondsTo: #isSubmodule) ifTrue:
			[dict at: #isSubmodule put: each isSubmodule].
		modes at: each put: dict]].'!
