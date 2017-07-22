accessing
initializeInstVarNamed: aString of: anObject with: aDiskProxy
	^ self add: (SquotInstVarSlot key: aString value: aDiskProxy) toSlotOverridesOf: anObject