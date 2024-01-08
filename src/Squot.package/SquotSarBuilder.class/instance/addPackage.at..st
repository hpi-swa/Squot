building
addPackage: aPackage at: aPath
	(self addedPackages includes: aPackage) ifTrue: [^ self].
	self
		addVersion: ((MCWorkingCopy forPackage: aPackage)
						newVersionWithName: aPackage name
						message: 'Created by Squot for an export to a .sar')
		at: aPath.