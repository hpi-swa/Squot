(PackageInfo named: 'FileSystem-Git') postscript: '"code to be run after the loading of this package"
"initialize GitTreeEntry mode inst var"
modes := Smalltalk globals at: #TEMP_GitTreeEntryModes.
modes keysAndValuesDo: [:entry :modes |
	entry convertToCurrentVersion: modes refStream: nil].
"clean up"
Smalltalk globals removeKey: #TEMP_GitTreeEntryModes.'!
