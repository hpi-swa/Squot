as yet unclassified
baseline: spec
	<baseline>
	spec for: #common do: [
		spec 
			package: 'LBGit';
			package: 'LBGit-Tests' with: [spec requires: #('LBGit')];
			group: 'default' with: #('LBGit');
			group: 'tests' with: #('LBGit-Tests')
		].