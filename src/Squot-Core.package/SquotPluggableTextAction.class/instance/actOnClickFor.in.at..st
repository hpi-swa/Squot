mouse events
actOnClickFor: model in: aParagraph at: clickPoint
	^ self eval: {model. aParagraph. clickPoint}