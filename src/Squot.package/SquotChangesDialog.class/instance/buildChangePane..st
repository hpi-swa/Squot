toolbuilder
buildChangePane: builder
	^ BuildInParent child: 
		((DynamicToolBuilderMorph on: self specSelector: #buildChange:)
			layoutFrame: LayoutFrame fullFrame;
			yourself)