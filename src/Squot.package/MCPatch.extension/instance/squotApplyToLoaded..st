*Squot-patching
squotApplyToLoaded: aPackageInfo
	| loader |
	loader := MCPackageLoader new.
	self applyTo: loader.
	loader loadWithNameLike: aPackageInfo packageName.