(PackageInfo named: 'FileSystem-Git') preamble: '"code to be run before the loading of this package"
| VersionsBrowser |

"2017-05-13: Migrate GitTreeEntry mode variables"
(Environment current classNamed: #GitTreeEntry) ifNotNil: [:GitTreeEntry | | modes |
	(GitTreeEntry instVarNames includes: ''isInFilemode'') ifTrue:
		[modes := Smalltalk globals at: #TEMP_GitTreeEntryModes put: IdentityDictionary new.
		GitTreeEntry allInstancesDo: [:each | | dict |
			dict := Dictionary new.
			dict at: #isInFilemode put: each isInFilemode.
			(each respondsTo: #isSubmodule) ifTrue:
				[dict at: #isSubmodule put: each isSubmodule].
			modes at: each put: dict]]].

"2021-05-07: Restore original of shadowed fromUnixTime: method, see https://github.com/hpi-swa/Squot/issues/255"
((DateAndTime respondsTo: #fromUnixTime:) and: [(VersionsBrowser := Environment current classNamed: ''VersionsBrowser'') notNil]) ifTrue: [
	| versionsBrowser changeRecord |
	versionsBrowser := VersionsBrowser new scanVersionsOf: DateAndTime class >> #fromUnixTime: class: DateAndTime meta: true category: nil selector: #fromUnixTime:.
	changeRecord := versionsBrowser changeList
		detect: [:cr | (cr category beginsWith: ''*FileSystem-Git'') not]
		ifNone: [].
	changeRecord ifNotNil:
		[Smalltalk globals at: #TEMP_Squot_ShadowedChangeRecord255 put: changeRecord]].'!
