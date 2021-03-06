# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
	projects = [
{:title => 'SOMAC',
:description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at risus eu dolor ultricies consectetur id ut elit. Phasellus in arcu tellus, eu elementum magna. Etiam vel enim sed nisi lobortis eleifend. Quisque mollis commodo neque, in venenatis orci dapibus eget. Nam id mattis leo. Mauris et arcu enim, vel tincidunt ante. Aliquam a neque mauris. Sed pretium mauris at nunc consequat ut consequat lorem pretium. Nullam magna lacus, suscipit sed tempor aliquam, convallis vitae elit. Pellentesque porta sodales ante sit amet laoreet. Nullam sodales pretium lorem vel mollis. Nunc mollis, est quis gravida ultrices, enim ante semper felis, at egestas elit erat sed nibh. Fusce suscipit accumsan ligula. Mauris tincidunt elit ut nisi venenatis vel viverra elit tristique. Maecenas turpis turpis, iaculis at ultricies ac, tristique quis orci. Donec blandit auctor augue sit amet egestas.',
 :owner => 'sbjornsson',
 :deadline => 'Feb-02-2014',
 :confirmed_at => Time.now,
 :user_id => 3},

{:title => 'Colgate Calendar',
:description => 'Curabitur ut massa diam, sit amet bibendum tellus. Morbi consequat faucibus odio, et elementum ipsum molestie ac. Nam faucibus vulputate lacus, sed porttitor metus mattis non. Curabitur consequat facilisis augue non pulvinar. Phasellus eu posuere nisl. Cras felis odio, varius quis tristique sit amet, malesuada a urna. Morbi augue erat, lobortis eu consequat in, venenatis sit amet mi. Donec et mi sit amet eros congue ultricies. Duis eget mollis metus. Quisque a sapien nec neque porta luctus.',
 :owner => 'sbjornsson',
 :deadline => 'Jun-06-2013',
 :confirmed_at => Time.now,
 :user_id => 3},

{:title => 'Cool New Website',
:description => 'Pellentesque diam risus, pharetra et sollicitudin ac, lobortis in sapien. Nam a mauris arcu, ac lacinia felis. Fusce sed lorem sem, quis elementum enim. Sed non egestas magna. Suspendisse porttitor, arcu et ullamcorper lobortis, elit metus molestie purus, id feugiat nisi velit eget risus. Quisque sit amet risus eget metus tincidunt lacinia non nec risus. Phasellus sit amet tempus turpis. Cras eget lectus quis felis varius consectetur. In in lorem tincidunt lacus adipiscing rutrum. Vivamus sit amet laoreet arcu. Aenean ac tortor et nisi lacinia mattis non ut purus. Maecenas massa neque, gravida non porta elementum, fermentum ac risus.',
 :owner => 'sbjornsson',
 :deadline => 'Jun-06-2013',
 :confirmed_at => Time.now,
 :user_id => 3},

{:title => 'Zoc Doc web page',
:description => 'Nullam sagittis vehicula nunc, in hendrerit justo lobortis eget. Suspendisse eget blandit elit. Vivamus vitae erat neque. In sapien enim, pulvinar non fermentum quis, rhoncus id sapien. Sed vehicula porta mauris id tincidunt. Integer dolor purus, interdum at cursus sed, dapibus vel nibh. Aliquam suscipit dictum metus, ac ullamcorper urna dapibus a. Sed turpis odio, sodales vitae volutpat vel, adipiscing id turpis. Praesent imperdiet ullamcorper auctor. Proin eget libero erat, quis cursus urna. Proin malesuada posuere nunc condimentum ultricies. Sed dignissim risus quis purus tempus tincidunt accumsan est laoreet. Suspendisse ac velit mi. Mauris at lectus sed massa vulputate euismod quis sed metus. In hac habitasse platea dictumst.',
 :owner => 'sbjornsson',
 :deadline => 'Jun-06-2013',
 :confirmed_at => Time.now,
 :user_id => 3},

{:title => 'Project3',
:description => 'Aliquam quis nulla at dolor varius pulvinar vitae sit amet orci. Maecenas malesuada, magna vitae fermentum tincidunt, mi nunc semper leo, sit amet scelerisque turpis eros et risus. Pellentesque egestas dolor in augue fermentum a dictum orci volutpat. Pellentesque nec sapien metus, eu fringilla mauris. Morbi ultrices, quam sed fermentum placerat, libero neque euismod justo, molestie imperdiet tellus ligula ut tortor. Suspendisse sodales massa fermentum tortor vehicula condimentum. Etiam vel nisl sed lorem ornare pulvinar.',
 :owner => 'tcharron480',
 :deadline => 'Jun-06-2013',
 :confirmed_at => Time.now,
 :user_id => 1},

{:title => 'Somac Scheduling Site',
:description => 'In elit neque, vehicula non pharetra ut, commodo sed sapien. Praesent lobortis, massa ac fermentum iaculis, erat arcu lobortis diam, in aliquam nisi leo fringilla elit. Curabitur a pulvinar elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquam tristique enim, eget venenatis magna sollicitudin sed. Pellentesque in enim nibh. Nulla tincidunt erat metus. Fusce eu diam id diam placerat sodales a a erat. Vestibulum facilisis diam in nibh ullamcorper euismod. Maecenas lobortis sagittis lorem, nec vestibulum nibh faucibus at. Quisque blandit orci vel justo egestas id accumsan est aliquam. Proin at dapibus libero. Mauris pulvinar condimentum nunc, sed scelerisque nisi dapibus sed. Aliquam erat volutpat. Duis aliquet ipsum ut eros pretium aliquam id ut lectus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 
:owner => 'jgrossmann', 
:deadline => 'Aug-06-2013' ,
 :confirmed_at => Time.now,
 :user_id => 2},
								
{:title => 'Colgate Calendar App',
:description => 'Morbi posuere, elit et ullamcorper molestie, turpis ante accumsan massa, vitae tincidunt felis ligula eu eros. Maecenas consectetur imperdiet odio id vestibulum. Mauris non felis sed leo adipiscing elementum at vel sapien. Praesent aliquam aliquet lectus, in ultrices lectus sollicitudin et. Sed malesuada laoreet lacus, vitae dignissim felis sollicitudin sit amet. Aliquam feugiat pulvinar est, vitae porta leo ornare eget. Curabitur nisi tellus, congue eget lobortis in, interdum vulputate elit. Nullam volutpat, nisl nec porta elementum, dolor quam condimentum dui, eget fermentum mi tellus non augue.',
:owner => 'jgrossmann', 
:deadline => 'Jun-06-2013',
 :confirmed_at => Time.now,
 :user_id => 2},

{:title => 'Startup Website',
:description => 'Vivamus sit amet nibh non arcu vestibulum iaculis. Quisque dictum, sapien vitae dignissim semper, felis felis interdum lacus, non tincidunt lectus elit sed diam. Cras et metus dui, at fringilla risus. Sed nisl turpis, luctus aliquet tincidunt ut, tempor at eros. Proin nec tortor ligula. Vestibulum adipiscing, diam non pellentesque commodo, libero libero elementum nulla, ac ornare ipsum magna non risus. Vestibulum odio diam, feugiat in suscipit non, malesuada in leo. Proin quis justo ante. Morbi sit amet magna diam, ut dictum eros.', 
:owner => 'sbjornsson', 
:deadline => 'Feb-1-2014',
 :confirmed_at => Time.now,
 :user_id => 3}]


	projects.each do |project|
		Project.create!(project)
	end

	users = [{:username => 'TCharron480', :firstname => 'Thomas', :lastname => 'Charron', :email => 'tcharron@colgate.edu', :password => 'password', :confirmed_at => Time.now, :usertype => "colgate_student"}, {:username => 'JGrossmann', :firstname => 'John', :lastname => 'Grossmann', :email => 'jgrossmann@colgate.edu', :password => 'password', :confirmed_at => Time.now, :usertype => "colgate_student"}, {:username => 'SBjornsson', :firstname => 'Sean', :lastname => 'Bjornsson', :email => 'sbjornsson@colgate.edu', :password => 'password', :confirmed_at => Time.now, :usertype => "colgate_student"}, {:username => 'empty', :firstname => 'John', :lastname => 'smith', :email => 'jgrossmann@students.colgate.edu', :password => 'password', :confirmed_at => Time.now, :usertype => "colgate_student"}, {:username => 'professor', :firstname => 'jim', :lastname => 'moriarty', :email => 'killsherlock@villain.com', :password => 'password', :confirmed_at => Time.now, :usertype => "non_student"}]

	users.each do |user|
		User.create!(user)
	end

