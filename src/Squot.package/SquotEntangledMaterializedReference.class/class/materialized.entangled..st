instance creation
materialized: aReference entangled: anEntangledReference
	^ self new
		setMaterializedReference: aReference
		entangledReference: anEntangledReference;
		yourself