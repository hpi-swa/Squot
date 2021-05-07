private
classShadowFromArtifact: anArtifact
	^ SquotClassShadow new
		snapshot: (MCSnapshot fromDefinitions:
			(anArtifact shadowOfTrackedObject
				definitions select: [:each | (each respondsTo: #actualClass "cannot use className because of Object>>className") and: [each className = className]]));
		yourself