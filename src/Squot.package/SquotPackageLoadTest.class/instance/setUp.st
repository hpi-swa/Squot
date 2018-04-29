running
setUp
	changeLogSuppressor := SUnitChangeLogSuppressor new.
	imageStore := SquotImageStore new.
	classFactory := ClassFactoryForTestCase new.
	self suppressChangeNotificationsDuring: [class := classFactory newClass].
	className := class name.
	package := PackageInfo new packageName: classFactory packageName.