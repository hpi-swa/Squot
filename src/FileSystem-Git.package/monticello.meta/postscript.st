(PackageInfo named: 'FileSystem-Git') postscript: '"code to be run after the loading of this package"
| changeRecord |

"initialize GitTreeEntry mode inst var"
modes := Smalltalk globals at: #TEMP_GitTreeEntryModes.
modes keysAndValuesDo: [:entry :modes |
	entry convertToCurrentVersion: modes refStream: nil].
"clean up"
Smalltalk globals removeKey: #TEMP_GitTreeEntryModes.'!

"Restore original of shadowed method, see #255"
changeRecord := Smalltalk globals at: #TEMP_Squot_ShadowedChangeRecord255 ifAbsent: [nil].
changeRecord ifNotNil: [
    changeRecord fileIn.
    Smalltalk globals removeKey: #TEMP_Squot_ShadowedChangeRecord255].'!
