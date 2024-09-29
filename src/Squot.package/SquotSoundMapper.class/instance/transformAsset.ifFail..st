as yet unclassified
transformAsset: aSound ifFail: aBlock
	^ [aSound ifNotNil: #asSampledSound]
		on: Error
		do: [:error |
			self inform: ('Cannot sample {1}: {2}' format: {aSound. error}).
			^ aBlock value]