# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

f1 = Floof.create(:name=>'Ollie',:birth_date=>'2015-04-15',:color=>'cream',:sex=>'M',:description=>'Best lil guy')
f2 = Floof.create(:name=>'Riley',:birth_date=>'2017-09-17',:color=>'white',:sex=>'F',:description=>'Riley pup!')
f3 = Floof.create(:name=>'Bear',:birth_date=>'2019-08-01',:color=>'brown',:sex=>'M',:description=>'Little bear boy!')

req_1 = FloofRentalRequest.create(:floof_id=>f1.id,:start_date=>'2020-11-10',:end_date=>'2020-11-14',:status=>'APPROVED')
req_2 = FloofRentalRequest.create(:floof_id=>f1.id,:start_date=>'2020-11-05',:end_date=>'2020-11-13')
req_3 = FloofRentalRequest.create(:floof_id=>f1.id,:start_date=>'2020-11-10',:end_date=>'2020-11-21')
req_4 = FloofRentalRequest.create(:floof_id=>f1.id,:start_date=>'2020-11-05',:end_date=>'2020-11-21',:status=>'APPROVED')