instance creation
owner: anObject mirror: aMirror reference: aReference
	^ self new
		setOwner: anObject mirror: aMirror reference: aReference;
		yourself