tests
untrackPackage
	SquotToggles useNewApi ifTrue: [^ self].
	imageStore := SquotImageStore new.