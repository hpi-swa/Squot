accessing
selectedPackageName: aString
	selectedPackageName := aString.
	self
		changed: #selectedPackageName;
		changed: #isSelectedPackageUnmapped;
		changed: #isSelectedPackageMapped.