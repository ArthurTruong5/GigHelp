## [GigHelp Link](https://cryptic-brook-68449.herokuapp.com/)
# GigHelp ![CI status](https://img.shields.io/badge/build-passing-brightgreen.svg)

GigHelp is a community gig marketplace which provides people to outsource everyday work. Users are able to choose a task and people in the community can bid for the task.

## [Repo Link](https://github.com/ArthurTruong5/GigHelp)

## Installation

To install

`$ git clone https://github.com/ArthurTruong5/GigHelp.git`

`$ cd GigHelp`

`$ bundle install`

`$ rake db:create`

`$ rake db:migrate`

### Requirements

*  Ruby 2.2.4
* Rails 5.2.0



## Process


Before developing GiGhelp, I thought through questions such as:

* How can we entice people to join GigHelp?

* What makes us different than Airtasker?


* How can we make it more community based?

* How can we incorporate payment systems that we've been learning?

## ERD

![alt text](https://i.imgur.com/wviWq7N.jpg)

## Workflow Diagram

![alt text](https://i.imgur.com/TKkXHkb.png)

## Project Plan - Estimation

![alt text](https://i.imgur.com/qNCqDsq.png)

## Wireframes

![alt text](https://i.imgur.com/RtNlZ1G.png)

## Planning and Workflow

![alt text](https://i.imgur.com/z6mg0BI.jpg)

## Technology Stack

* HTML/CSS
* Ruby on Rails

## Future

* Fix CSS/HTML issues
* Make it more responsive
* Add Javascript (React) for the front end
* Add Ajax
* Create a user profile
* Make it more community based - e.g add subtask; like subreddits on Reddit so community has more control.


## User Story

When a user logins, we want to show the home page and give them a feel of what GigHelp is about. Background image of a person on a computer to to represent that they are finding/bidding a task. When the user wants to see what kind of task are out there, they can use the search to display all task from the task index views. For example, writing 'cleaning' would show all titles that relate to cleaning. The user has easy access to register through Google omniauth. Easy usability is what I wanted to to aim for. The user can also have free reign to post a task or bid on a existing task. They can also search nearby task around them near their corresponding location.


## Homepage design

Designing the homepage was a challenging process. One of the requirements was to add a search functionality and I wanted a way users could find task by title. This would simplify the process of what users needed. e.g cleaning would show every title that has "cleaning" keyword and is filtered through pg_search gem.

![alt text](https://i.imgur.com/RtpVdKN.jpg)

Once I selected the overall layout, I selected the color scheme. The idea was to pick a color that would build around trust and community and using blue as the main color scheme. According to whycolourmatters.com, "most blues convey a sense of trust, loyalty, cleanliness, and understanding." My second color choice was using a light green to symbolise nature that can represent most of my buttons and highlights.

## Task

A user can create a task and is asked certain required questions. The user will then be redirected to a address page. The geolocator gem is able to scout out other nearby task and will output metres on a 20km radius.

```ruby
<% for location in @location.nearbys(20) %>
<li><%= link_to location.address, task_location_path %> (<%= location.distance.round(2) %> miles) (<%= @task.title %>)</li>
<% end %>
```

![alt text](https://i.imgur.com/edzxQxCr.png)

## Images/Multimedia

I used https://www.pexels.com/ for free copyright images and picked certain images that would fit my color scheme.

![alt text](https://i.imgur.com/ienbM8B.jpg)

## Views/Locations/Bids

Users are able to see the information about the task. The user who creates the task can also accept offers. Note that only the user that CREATES the task can see the accept button offer. The user will be proceeded to the next window for payment. Payment will be then sent out to the bid user once task is confirmed finished.

![alt text](https://i.imgur.com/9IEu2vL.png)




## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
