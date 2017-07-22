*Squot-trackable
squotInitializeStoreInfo: aTrackedObjectMetadata
	super squotInitializeStoreInfo: aTrackedObjectMetadata.
	"Do not capture my owner, as I am the top-level tracked object here."
	aTrackedObjectMetadata ignoreInstanceVariable: 'owner' in: self.