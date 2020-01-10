(PackageInfo named: 'FileSystem-Git') preamble: '"Restore original of shadowed method, see #255"

| versionsBrowser changeRecord |
(DateAndTime respondsTo: #fromUnixTime:)
	ifFalse: [^ self].
versionsBrowser := VersionsBrowser new scanVersionsOf: DateAndTime class >> #fromUnixTime: class: DateAndTime meta: true category: nil selector: #fromUnixTime:.
changeRecord := versionsBrowser changeList
	detect: [:cr | (cr category beginsWith: ''*'') not]
	ifNone: [^ self].
Smalltalk globals at: #TEMP_Squot_ShadowedChangeRecord255 put: changeRecord.'!
