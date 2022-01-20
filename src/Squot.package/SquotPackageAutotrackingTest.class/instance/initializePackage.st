tests
initializePackage
	SystemChangeNotifier uniqueInstance doSilently: [class := classFactory newClass].
	class compileSilently: 'a ^ 1'.
	package := PackageInfo named: class category.