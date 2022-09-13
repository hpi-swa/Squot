as yet unclassified
addUserSettingsOfAll: aCollection in: aSquotWorkingCopy to: aPluggableMenuSpec 
	"Add a toggle for the squeakchangestamp package property."
	"Question: is the dictionary in SquotPackageInfoExtension ever cleaned up?"
	| hasChangeStampsEnabled |
	hasChangeStampsEnabled := aCollection allSatisfy: [:each | (SquotPackageInfoExtension of: (PackageInfo named: each packageName)) tonelProperties at: TonelWriter squeakChangestamp ifAbsent: [false]].
	aPluggableMenuSpec add: (hasChangeStampsEnabled ifTrue: ['<yes> '] ifFalse: ['<no> ']), 'Store change stamps' translated target: aSquotWorkingCopy selector: #tonelToggleChangeStampsOfAll: argumentList: {aCollection}.
	^ aPluggableMenuSpec