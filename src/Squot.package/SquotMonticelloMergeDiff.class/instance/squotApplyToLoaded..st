patching
squotApplyToLoaded: aPackageInfo
	| loader |
	self deprecated: 'Get resolvedPatch and apply that instead.'.
	(conflicts anySatisfy: [:each | each isResolved not]) ifTrue:
		[self error: 'Conflicts must be resolved first!'].
	loader := MCPackageLoader new.
	conflicts do: [:each | each applyTo: loader].
	operations do: [:each | each applyTo: loader].
	loader loadWithNameLike: aPackageInfo name.
	^ aPackageInfo