actions on objects
actionPackageInfoObjectEditPostscript
	| packageInfo |
	packageInfo := self loadedSelectedObject.
	^ packageInfo postscript openLabel: 'Postscript of package ', packageInfo name