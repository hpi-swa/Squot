(PackageInfo named: 'FileSystem-Git') postscript: '"Restore original of shadowed method, see #255"

| changeRecord |
changeRecord := Smalltalk globals at: #TEMP_Squot_ShadowedChangeRecord255 ifAbsent: [^ self].
changeRecord fileIn.
Smalltalk globals removeKey: #TEMP_Squot_ShadowedChangeRecord255.	'!
