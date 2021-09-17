EventTrackr Reports and Data (hereby referred to as ‘ERD’)
==========================================================

ERD will is implemented with the intent of giving developers to this project an easy way to generate fake data outside of rspec and testing environment as well as a way to present both actual and fake data visually using SQL expressions.

Gems used:

    FactoryBot (add gem 'factory_bot_rails' to your gemfile)
    Faker (add gem 'faker' to your gemfile)
    Blazer Reports (add gem 'blazer' to your gemfile)

Features
--------

- Automated database population for event and member objects to save developer time
- Visual representation of total members and member attendance breakdown by event, with many more options using SQL queries

Installation
------------

Clone EventTrackr codebase by running:

    	git clone https://github.com/codeGobbler/Event-Attendance.git

Upon cloning the database, checkout a branch called ‘blazer_reports’ by running:

    	git checkout -b blazer_reports

Setting up the database with fake data
--------------------------------------

Upon creating your new branch you need to create a db/seeds.rb file, it should have these 2 lines of code:

	require 'factory_bot_rails'

Seeds::SampleEvents.run

This tells the program to run the code in the file located in lib/tasks/sample_event_data.rb:

require 'factory_bot'

module Seeds
  class SampleEvents
    def self.run
      FactoryBot.create_list(:event, 5)
    end
  end
end

Which creates 5 fake events via FactoryBot and Faker (see spec/factories for factory source code), the events are in turn automatically associated to 5 fake members which are all now in the database for use in development.

Once you’ve created your file at db/seeds.rb, you can now run this command in your terminal:

	bin/rails db:reset

This will wipe out your current database and replace it with 5 fake event and 25 fake member objects

Using the reporting feature
===========================

Start your server by running:

	bin/rails s

Once the app has loaded, you will need to click ‘sign in’ and then the ‘sign up’ link. Even if you’ve previously created a profile, when you ran:

	bin/rails db:reset

The database wiped all files including user records.

Once you’ve created a new login, use the navigation bar to checkout the new event and member records created in the ‘event’ and ‘members’ tabs. There should be 5 new events and 25 new member records.

Once you confirm the new data, navigate to the ‘reports’ tab.

This will throw a ‘recordnotfound’ error (have not yet implemented error handling for this, will be in update). For now, you can truncate the url in the address bar to read: http://localhost:3000/blazer.

This will bring you to the blazer homepage. From here, you will want to input your SQL queries for ‘Total Users’ and ‘Event Attendance by Event’. 

You can find the appropriate queries located in db/sql_expressions_for_blazer.sql. Select ‘New Query’ from the upper right corner of the page. 

Next, cut and paste the desired queries into the blazer UI, click ‘run’ to verify they work and provide a clear name and description. Once you’ve done all this click ‘update’.

After you’ve created both queries, you can create your dashboard. Click ‘New Dashboard’ and follow the instructions to get it set up.

Once your dashboard is created, you can navigate back to http://localhost:3000/ and click on the ‘reports’ tab. It should navigate to the dashboard that displays all active members and event attendance by event.


Contribute
----------

- Issue Tracker: https://github.com/peterntiamoah/Event-Attendance/issues
- Source Code: https://github.com/peterntiamoah/Event-Attendance
