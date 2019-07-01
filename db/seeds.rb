# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

poll = Poll.create ({description: 'Should Fireforks Be Banned on Christmas?'})
poll.options.create([
                             {description: 'Yes'},
                             {description: 'No'},
                             {description: 'IDK'},
                             {description: 'IDC'}])

poll = Poll.create ({description: 'Does Grafa Street Look Better Now?'})
poll.options.create([
                             {description: 'Yes'},
                             {description: 'No'},
                             {description: 'IDK'},
                             {description: 'IDC'}])

poll = Poll.create ({description: 'Best Vacation Destination'})
poll.options.create([
                             {description: 'Bali'},
                             {description: 'Pavel Banya'},
                             {description: 'Las Vegas'},
                             {description: 'The Maldives'},
                             {description: 'Other'}])
