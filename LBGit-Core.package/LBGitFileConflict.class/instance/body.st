as yet unclassified
body

	^ 
('Loaded change: ', self leftChange title) asText allBold, '
	
', self leftChange body, '

',('Incoming change: ', self rightChange title) asText allBold, '
	
', self rightChange body