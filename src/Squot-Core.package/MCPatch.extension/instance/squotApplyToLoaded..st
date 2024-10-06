*Squot-Core-diff-patching
squotApplyToLoaded: aPackageInfoOrClass
	| loader |
	loader := MCPackageLoader new.
	self applyTo: loader.
	loader loadWithNameLike: aPackageInfoOrClass name.
	^ aPackageInfoOrClass