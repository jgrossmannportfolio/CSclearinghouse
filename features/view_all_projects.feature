Feature: View all the projects that have been posted

As a visitor to the website
So that I can browse projects that have been posted
I want to be able to see all projects

Background: projects on website

	Given the following projects exist: 

	| title       | description    |
    | Project4    | Test Project 4 |
    | Project5    | Test Project 5 |

Scenario: Display all posted projects
  When I go to the projects page