(PackageInfo named: 'FileSystem-Git') postscript: '"code to be run after the loading of this package"
"initialize GitTreeEntry mode inst var"
modes := Smalltalk globals at: #TEMP_GitTreeEntryModes.
modes keysAndValuesDo: [:entry :modes |
	entry convertToCurrentVersion: modes refStream: nil].
"clean up"
Smalltalk globals removeKey: #TEMP_GitTreeEntryModes.

"2020-03-10: turn objectCache from Dictionary into GitObjectCache. Just invalidate the cache."
GitRepository allInstancesDo: [:each | each flushCaches].
GitUnitOfWork allInstancesDo: [:each | each initializeCaches].
'!
