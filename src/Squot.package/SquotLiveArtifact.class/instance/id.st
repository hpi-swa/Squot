accessing
id
	"Assign a new id if none was assigned yet. This also updates SquotImageStores created with older Squot versions when the ids did not exist yet."
	^ storeInfo at: #id ifAbsentPut: [SquotArtifact newId]