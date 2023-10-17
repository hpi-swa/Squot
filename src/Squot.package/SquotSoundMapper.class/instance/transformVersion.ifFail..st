as yet unclassified
transformVersion: aSound  ifFail: aBlock
	^ [aSound ifNotNil: #asSampledSound]
		on: Error
		do: [:error |
			self inform: ('Cannot sample {1}: {2}' format: {aSound. error}).
			^ aBlock value]