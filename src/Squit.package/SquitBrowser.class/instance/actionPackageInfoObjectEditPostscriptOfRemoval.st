actions on objects
actionPackageInfoObjectEditPostscriptOfRemoval
	| packageInfo |
	packageInfo := self loadedSelectedObject.
	^ packageInfo postscriptOfRemoval openLabel: 'Postscript for removal of package ', packageInfo name