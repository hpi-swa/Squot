actions on objects
actionPackageInfoObjectEditPreambleOfRemoval
	| packageInfo |
	packageInfo := self loadedSelectedObject.
	^ packageInfo preambleOfRemoval openLabel: 'Preamble for removal of package ', packageInfo name