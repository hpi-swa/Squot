private
checkName: name
	addedObject hasSquotShadowName ifTrue:
		[self assert: name = addedObject name description: 'Object has a different name'].