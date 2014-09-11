# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Metric.find_or_create_by(name: "Value of Technology").update_attributes(description: "Does the technology purport to solve a socially valuable problem?  What is the difficulty of the problem being solved?  What is the appropriateness or cleverness of the solution? The uniqueness?")
Metric.find_or_create_by(name: "Effectiveness of Technology").update_attributes(description: "What is the appropriateness or cleverness of the solution?  The uniqueness?  Do you believe that the technology is capable of solving the problem in a way that customers would be willing to pay for it?  Does this solution have a viable place within the technology area within which it falls?")
Metric.find_or_create_by(name: "Market Potential").update_attributes(description: "Based on the application and what you know or believe, does the innovation serve a market or segment of a wider market that has sufficient size to provide either licensing opportunities or ability to support a stand-alone company?  Does this market have good growth prospects?")
Metric.find_or_create_by(name: "Commercialization").update_attributes(description: "Do you believe the innovation can be shown (at least on prima facie grounds) to be capable of commercialization and the innovator and team can be capable of achieving commercial status?")
Metric.find_or_create_by(name: "Time to Commercialization").update_attributes(description: "Based on the information in the application, do you believe that the innovation can achieve some meaningful level of commercialization by May of 2015 given a grant of the money requested in the application budget?")
Metric.find_or_create_by(name: "Leadership and Team").update_attributes(description: "Is there team synergy?  Does the team have the reprensative skills needed to executethe business plan?")