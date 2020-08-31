*Squot-Packages
packageSerializer
	"Answer the serializer used by the first encountered package."
	^ (self artifacts
		detect: [:each | each storeInfo objectClassName = #PackageInfo]
		ifNone: [^ nil])
		storeInfo serializer