actions on objects
actionPackageInfoObjectEditPreamble
	| packageInfo |
	packageInfo := self loadedSelectedObject.
	^ packageInfo preamble openLabel: 'Preamble of package ', packageInfo name