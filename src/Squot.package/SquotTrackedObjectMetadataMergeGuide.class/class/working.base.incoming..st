instance creation
working: workingTrackedObjectMetadata base: baseTrackedObjectMetadata incoming: incomingTrackedObjectMetadata
	^ self new
		setWorking: workingTrackedObjectMetadata base: baseTrackedObjectMetadata incoming: incomingTrackedObjectMetadata;
		yourself