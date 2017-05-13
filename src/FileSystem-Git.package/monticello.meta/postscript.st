(PackageInfo named: 'FileSystem-Git') postscript: '"code to be run after the loading of this package"
"initialize GitTreeEntry isSubmodule inst var"
GitTreeEntry allInstancesDo: [:each |
	each isInFilemode
		ifTrue: [each beInFilemode]
		ifFalse: [each isSubmodule ifNil: [each beInDirectorymode]]].'!
