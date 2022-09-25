running
setUp
	changeLogSuppressor := SUnitChangeLogSuppressor new.
	imageStore := SquotToggles useNewApi
		ifTrue: [SquotPackageStore environment: Smalltalk globals]
		ifFalse: [SquotImageStore new].
	classFactory := ClassFactoryForTestCase new.
	self suppressChangeNotificationsDuring: [class := classFactory newClass].
	className := class name.
	package := PackageInfo new packageName: classFactory packageName.