private
findProjectWith: aSquitBrowser
	aSquitBrowser projectsWithRepository: repository do: [:each | ^ each].