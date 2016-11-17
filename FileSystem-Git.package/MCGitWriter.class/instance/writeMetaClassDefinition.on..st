writing
writeMetaClassDefinition: aClassDefinition on: aStream 

	aStream nextPutAll: aClassDefinition className;
			nextPutAll: ' class';
			lf; tab.
			
	aClassDefinition hasClassTraitComposition ifTrue: [
		aStream nextPutAll: 'uses: ';
			nextPutAll: aClassDefinition classTraitCompositionString;
			lf; tab].
		
	aClassDefinition hasClassInstanceVariables ifTrue: [
		aStream nextPutAll: 'instanceVariableNames: ''';
			nextPutAll: aClassDefinition classInstanceVariablesString;
			nextPut: $']