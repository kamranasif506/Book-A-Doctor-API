User.destroy_all
Doctor.destroy_all
Specialization.destroy_all


@user1 = User.create!(email: 'akezeth@gmail.com', password: '123456')
@user2 = User.create!(email: 'addis@gmail.com', password: '234567')
@user3 = User.create!(email: 'kamran@gmail.com', password: '345678')
@user4 = User.create!(email: 'hassan@gmail.com', password: '456789')

Specialization.create!(name: 'Pathology')
Specialization.create!(name: 'Internal Medicine')
Specialization.create!(name: 'Neurology')
Specialization.create!(name: 'Pediatrics')

Doctor.create!(
     doctor_name: "Dr. John",
     profile_picture: "https://media.istockphoto.com/id/1470505351/photo/portrait-of-a-smiling-doctor-holding-glasses-and-a-mobile-phone-at-the-office.jpg?s=1024x1024&w=is&k=20&c=7qEjVevQHDkL8dPHuwJ3uRVGH4uOOljLhCtSq4vsA-Q=",
     location: "Ireland",
     specialization_id: 1,
     bio:"A very well educated doctor")
Doctor.create!(
     doctor_name: "Dr. Natashia",
     profile_picture: "https://media.istockphoto.com/id/1530248128/photo/portrait-of-cheerful-female-doctor-with-digital-tablet-beside-window-in-corridor.jpg?s=1024x1024&w=is&k=20&c=A6MnJQk3sXSXoiCgxw40_AOoxE3BTcZ0xs5LLk69rmE=",
     location: "Malaysia",
     specialization_id: 2,
     bio:"A  must see doctor")
Doctor.create!(
     doctor_name: "Dr. Mohammed",
     profile_picture: "https://media.istockphoto.com/id/1494324933/photo/portrait-of-asian-chinese-mixed-race-senior-mature-man-doctor-in-collared-business-shirt.jpg?s=1024x1024&w=is&k=20&c=P6phg1j7pVUhLaMHg8zNczRT3y0uoAuqAglKgGAxg6s=",
     location: "USA",
     specialization_id: 3,
     bio:"A doctor from Harvard")




