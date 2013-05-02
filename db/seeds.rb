# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
	projects = [{:title => 'Project1',:description => 'Test project1', :owner => 'Mrs. Buttersworth', :deadline => 'Jun-06-2013', :confirmed_at => '2013-04-03 13:13:04'},
								{:title => 'Project2',:description => 'Test project2', :owner => 'Mrs. Buttersworth', :deadline => 'Jun-06-2013', :confirmed_at => Time.now},
								{:title => 'Project3',:description => 'Test project3', :owner => 'Mrs. Buttersworth', :deadline => 'Jun-06-2013', :confirmed_at => Time.now}]

	projects.each do |project|
		Project.create!(project)
	end

	users = [{:username => 'TCharron480', :firstname => 'Thomas', :lastname => 'Charron', :email => 'tcharron@colgate.edu', :password => 'password', :confirmed_at => Time.now}, {:username => 'JGrossmann', :firstname => 'John', :lastname => 'Grossmann', :email => 'jgrossmann@colgate.edu', :password => 'password', :confirmed_at => Time.now}, {:username => 'SBjornsson', :firstname => 'Sean', :lastname => 'Bjornsson', :email => 'sbjornsson@colgate.edu', :password => 'password', :confirmed_at => Time.now}]

	users.each do |user|
		User.create!(user)
	end
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
