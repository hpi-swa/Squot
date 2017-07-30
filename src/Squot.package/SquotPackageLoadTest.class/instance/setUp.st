running
setUp
	imageStore := SquotImageStore new.
	classFactory := ClassFactoryForTestCase new.
	class := classFactory newClass.
	className := class name.
	package := PackageInfo new packageName: classFactory packageName.