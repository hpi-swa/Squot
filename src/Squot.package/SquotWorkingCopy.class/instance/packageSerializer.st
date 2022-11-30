*Squot-Packages
packageSerializer
	"Answer the serializer used by the first encountered package."
	^ (self anyPackageOrNil ifNil: [^ nil]) storeInfo serializer