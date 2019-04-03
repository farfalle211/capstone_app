User.create!([
  {age: 27, gender: "male", summary: "Hi :) ", location: "Chicago", name: "Mike", email: "mike@gmail.com", password_digest: "$2a$10$ttk0hq/ylGB.jNaqvDtuT.kbPInFx004h/Dvhg3Y13UMD.o1xX7Mu", phone_number: "+16095715366", latitude: "41.8876", longitude: "-87.6368"},
  {age: 25, gender: "male", summary: "Hi my name is Billy and I'm the guy that defrauded investors during the Fyre Festival. Get to know me. ", location: "Chicago, IL", name: "Billy", email: "billy@gmail.com", password_digest: "$2a$10$Qw18m4RgxMWhGon0PuV1E.iNc2bovKdRr5fOCatzFsTNJdmLGujMy", phone_number: "+16095715366", latitude: "41.8876", longitude: "-87.6368"},
  {age: 26, gender: "female", summary: "im from denver...", location: "Denver, CO", name: "sally", email: "sally@gmail.com", password_digest: "$2a$10$dTP2jdy8lbs3XbnNMD64tekAmIHNh5ouVr7Jx8RvIfSI88fWK/oCa", phone_number: "+18157937739", latitude: "41.8876", longitude: "-87.6368"}
])
Event.create!([
  {name: "ANA Inspiration - Weekly Badge", date: "2019-04-03 08:30:00", category: "Golf", location: "34600 Mission Hills Drive, Rancho Mirage, CA 92234", latitude: "33.7979", longitude: "-116.433"}
])
UserEvent.create!([
  {user_id: 1, event_id: 1, confirmation_status: "purchased", seating_quality: nil}
])
