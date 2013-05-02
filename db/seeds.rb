# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
	projects = [
{:title => 'Somac Scheduling Site',
:description => 'In elit neque, vehicula non pharetra ut, commodo sed sapien. Praesent lobortis, massa ac fermentum iaculis, erat arcu lobortis diam, in aliquam nisi leo fringilla elit. Curabitur a pulvinar elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquam tristique enim, eget venenatis magna sollicitudin sed. Pellentesque in enim nibh. Nulla tincidunt erat metus. Fusce eu diam id diam placerat sodales a a erat. Vestibulum facilisis diam in nibh ullamcorper euismod. Maecenas lobortis sagittis lorem, nec vestibulum nibh faucibus at. Quisque blandit orci vel justo egestas id accumsan est aliquam. Proin at dapibus libero. Mauris pulvinar condimentum nunc, sed scelerisque nisi dapibus sed. Aliquam erat volutpat. Duis aliquet ipsum ut eros pretium aliquam id ut lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 
:owner => 'Sean Bjornsson', 
:deadline => 'Aug-06-2013' },
								
{:title => 'Colgate Calendar App',
:description => 'Morbi posuere, elit et ullamcorper molestie, turpis ante accumsan massa, vitae tincidunt felis ligula eu eros. Maecenas consectetur imperdiet odio id vestibulum. Mauris non felis sed leo adipiscing elementum at vel sapien. Praesent aliquam aliquet lectus, in ultrices lectus sollicitudin et. Sed malesuada laoreet lacus, vitae dignissim felis sollicitudin sit amet. Aliquam feugiat pulvinar est, vitae porta leo ornare eget. Curabitur nisi tellus, congue eget lobortis in, interdum vulputate elit. Nullam volutpat, nisl nec porta elementum, dolor quam condimentum dui, eget fermentum mi tellus non augue.',
:owner => 'Sean Bjornsson', 
:deadline => 'Jun-06-2013'},

{:title => 'Startup Website',
:description => 'Vivamus sit amet nibh non arcu vestibulum iaculis. Quisque dictum, sapien vitae dignissim semper, felis felis interdum lacus, non tincidunt lectus elit sed diam. Cras et metus dui, at fringilla risus. Sed nisl turpis, luctus aliquet tincidunt ut, tempor at eros. Proin nec tortor ligula. Vestibulum adipiscing, diam non pellentesque commodo, libero libero elementum nulla, ac ornare ipsum magna non risus. Vestibulum odio diam, feugiat in suscipit non, malesuada in leo. Proin quis justo ante. Morbi sit amet magna diam, ut dictum eros.', 
:owner => 'Sean Bjornsson', 
:deadline => 'Feb-1-2014'}]

	projects.each do |project|
		Project.create!(project)
	end
=begin
	users = [{:username => 'TCharron480', :firstname => 'Thomas', :lastname => 'Charron', :email => 'tcharron@colgate.edu'}, {:username => 'JGrossmann', :firstname => 'John', :lastname => 'Grossmann', :email => 'jgrossmann@colgate.edu'}, {:username => 'SBjornsson', :firstname => 'Sean', :lastname => 'Bjornsson', :email => 'sbjornsson@colgate.edu'}]

	users.each do |user|
		User.create!(user)
	end
=end
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
