as yet unclassified
baseline: spec
	<baseline>
	spec for: #common do: [
		spec 
			package: 'LBGit-Core';
			package: 'LBGit-Tests' with: [spec requires: #('LBGit-Core')];
			group: 'default' with: #('LBGit-Core');
			group: 'tests' with: #('LBGit-Tests')
		].