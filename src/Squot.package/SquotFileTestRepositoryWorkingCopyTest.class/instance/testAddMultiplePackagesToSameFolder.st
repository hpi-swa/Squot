tests
testAddMultiplePackagesToSameFolder
	"When multiple packages are added at the same folder, the automatic renaming must ensure that they get distinct paths and do not overwrite each other."
	| package1 package2 encounteredWarning |
	package1 := PackageInfo new packageName: classFactory packageName, '-1'.
	package2 := PackageInfo new packageName: classFactory packageName, '-2'.
	["when"
	[workingCopy
		add: package1 at: 'src';
		add: package2 at: 'src']
	on: Warning do: [:w | encounteredWarning := true. w resume].
	"then"
	self assert: (workingCopy includesObject: package1).
	self assert: (workingCopy includesObject: package2).
	self assert: (workingCopy includesObjectAt: 'src/', package1 packageName, '.package').
	self assert: (workingCopy includesObjectAt: 'src/', package2 packageName, '.package').
	self assert: (workingCopy objectAt: 'src/', package1 packageName, '.package') = package1.
	self assert: (workingCopy objectAt: 'src/', package2 packageName, '.package') = package2.
	self deny: (workingCopy includesObjectAt: 'src').
	self deny: encounteredWarning == true]
	ensure:
		[(MCWorkingCopy allManagers select: [:each | each packageName = package1 packageName or: [each packageName = package2 packageName]])
			do: [:each | each unregister].
		Environment current packageOrganizer
			unregisterPackageNamed: package1 packageName;
			unregisterPackageNamed: package2 packageName].