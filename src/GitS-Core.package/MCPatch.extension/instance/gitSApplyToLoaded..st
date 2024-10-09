*GitS-Core-diff-patching
gitSApplyToLoaded: aPackageInfoOrClass
	| loader |
	loader := MCPackageLoader new.
	self applyTo: loader.
	loader loadWithNameLike: aPackageInfoOrClass name.
	^ aPackageInfoOrClass