testing
testPackageInfo
	"...because it creates totally different shadows (Monticello stuff)"
	| packageInfo shadow |
	packageInfo := PackageInfo new packageName: self class category; yourself.
	shadow := capturer capture: packageInfo.
	self assert: shadow species == MCSnapshot.