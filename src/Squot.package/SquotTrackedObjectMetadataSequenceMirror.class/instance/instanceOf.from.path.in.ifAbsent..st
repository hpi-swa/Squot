accessing
instanceOf: anObject from: sourceMetadata path: aSequenceableCollection in: searchMetadata ifAbsent: absentBlock
	^ SquotTrackedObjectMetadataMirror objectAtPath: aSequenceableCollection in: searchMetadata ifAbsent: absentBlock