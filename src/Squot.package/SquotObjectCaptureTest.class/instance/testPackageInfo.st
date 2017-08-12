testing
testPackageInfo
	"...because it creates totally different shadows (Monticello stuff)"
	| packageInfo shadow |
	packageInfo := PackageInfo new packageName: self class category; yourself.
	shadow := capturer captureStandalone: packageInfo.
	self assert: shadow species == SquotPackageShadow.
	shadow := capturer captureStandalone: (Array with: packageInfo).
	self assert: (shadow variablePartSlotWithIndex: 1) species == SquotPackageShadow.