*Squot-Packages
packageSerializer
	"Answer the serializer used by the first encountered package."
	^ (self artifacts
		detect: [:each | (each storeInfo at: #objectClassName ifAbsent: []) = #PackageInfo]
		ifNone: [^ nil])
		storeInfo serializer