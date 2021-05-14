(PackageInfo named: 'FileSystem-Git') postscript: '"code to be run after the loading of this package"
| modes changeRecord |

"2017-05-13: initialize GitTreeEntry mode inst var"
modes := Smalltalk globals at: #TEMP_GitTreeEntryModes ifAbsent: [Dictionary new].
modes keysAndValuesDo: [:entry :entryModes |
	entry convertToCurrentVersion: entryModes refStream: nil].
"clean up"
Smalltalk globals removeKey: #TEMP_GitTreeEntryModes ifAbsent: [].

"2020-03-10: turn objectCache from Dictionary into GitObjectCache. Just invalidate the cache."
"2020-04-20: changed structure of GitObjectCache and access in GitUnitOfWork"
GitRepository allInstancesDo: [:each | each flushCaches].
GitPackedRefStore allInstancesDo:
	[:each | 
	(each instVarNamed: ''baseDir'') ifNil:
		[each instVarNamed: ''baseDir'' put:
			((each repository isKindOf: GitUnitOfWork)
				ifTrue: [each repository repository]
				ifFalse: [each repository]) baseDir]].
GitUnitOfWork allInstancesDo:
	[:each |
		each
			flushCaches;
			convertToCurrentVersion: Dictionary new refStream: nil].

"2021-05-07: Restore original of shadowed fromUnixTime: method, see https://github.com/hpi-swa/Squot/issues/255"
changeRecord := Smalltalk globals at: #TEMP_Squot_ShadowedChangeRecord255 ifAbsent: [].
changeRecord ifNotNil:
	[[changeRecord fileIn]
		ensure: [Smalltalk globals removeKey: #TEMP_Squot_ShadowedChangeRecord255]].'!
