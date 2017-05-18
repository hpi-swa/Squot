(PackageInfo named: 'Squit') postscript: '"code to be run after the loading of this package"
SquitRepository allInstancesDo: [:each |
	each shouldWriteToDiskWorkingCopy ifNil: [each shouldWriteToDiskWorkingCopy: false]].
'!
