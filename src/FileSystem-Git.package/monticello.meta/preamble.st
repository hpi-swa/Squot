(PackageInfo named: 'FileSystem-Git') preamble: '"code to be run before the loading of this package"
| modes |

modes := Smalltalk globals at: #TEMP_GitTreeEntryModes put: IdentityDictionary new.
Smalltalk globals at: #GitTreeEntry ifPresent: [:GitTreeEntry |
	GitTreeEntry allInstancesDo: [:each | | dict |
		dict := Dictionary new.
		dict at: #isInFilemode put: each isInFilemode.
		(each respondsTo: #isSubmodule) ifTrue:
			[dict at: #isSubmodule put: each isSubmodule].
		modes at: each put: dict]].

"Restore original of shadowed method, see #255"
(DateAndTime respondsTo: #fromUnixTime:) ifTrue: [
	| versionsBrowser changeRecord |
	versionsBrowser := VersionsBrowser new scanVersionsOf: DateAndTime class >> #fromUnixTime: class: DateAndTime meta: true category: nil selector: #fromUnixTime:.
	changeRecord := versionsBrowser changeList
		detect: [:cr | (cr category beginsWith: ''*'') not]
		ifNone: [^ self].
	Smalltalk globals at: #TEMP_Squot_ShadowedChangeRecord255 put: changeRecord].'!
