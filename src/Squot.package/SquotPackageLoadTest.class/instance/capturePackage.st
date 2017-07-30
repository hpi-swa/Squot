testing
capturePackage
	imageStore add: package at: package name, '.package'.
	^ imageStore captureSnapshot