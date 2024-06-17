import '../../model/notificationModel.dart';

class MockDataRepository {

  static List<NotificationModel> notifications = [
    // Informational Notifications
    NotificationModel(
      title: "Adoption Application Received",
      message: "We've received your application to adopt [Pet Name]. We’ll review it and update you shortly!",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "Adoption Application Approved",
      message: "Congratulations! Your application to adopt [Pet Name] has been approved. Please check your email for next steps.",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "Adoption Application Rejected",
      message: "We're sorry, but your application to adopt [Pet Name] was not approved. You can still browse other pets available for adoption.",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "Adoption in Progress",
      message: "Your adoption process for [Pet Name] is in progress. Next step: [Next Step Detail].",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "New Pet Available",
      message: "[Pet Name] the [Breed] is now available for adoption. Check out their profile!",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "Pet Status Update",
      message: "Good news! [Pet Name] has been adopted. Explore other pets looking for a home.",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "Health Update for [Pet Name]",
      message: "[Pet Name] has just received their latest vaccinations and is in great health!",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "Adoption Follow-up Reminder",
      message: "It's time for your follow-up visit for [Pet Name]. Please contact us to schedule.",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "Complete Your Profile",
      message: "Your profile is incomplete. Complete it now to receive personalized pet recommendations.",
      type: NotificationType.informational,
    ),
    NotificationModel(
      title: "Upcoming Appointment",
      message: "Reminder: You have an appointment with [Shelter Name] for [Pet Name] on [Date] at [Time].",
      type: NotificationType.informational,
    ),
    // Transactional Notifications
    NotificationModel(
      title: "New Message from [User/Shelter Name]",
      message: "You have a new message regarding [Pet Name]. Check it out now!",
      type: NotificationType.transactional,
    ),
    NotificationModel(
      title: "Chat Updated",
      message: "[User/Shelter Name] has replied to your message about [Pet Name].",
      type: NotificationType.transactional,
    ),
    NotificationModel(
      title: "Payment Confirmation",
      message: "Your payment of \$[Amount] for adopting [Pet Name] was successful. Thank you!",
      type: NotificationType.transactional,
    ),
    NotificationModel(
      title: "Donation Received",
      message: "Thank you for your generous donation of \$[Amount]. It will help many pets in need.",
      type: NotificationType.transactional,
    ),
    // Promotional Notifications
    NotificationModel(
      title: "Discount on Adoption Fees",
      message: "This weekend only: 20% off adoption fees for all pets! Find your new friend today.",
      type: NotificationType.promotional,
    ),
    NotificationModel(
      title: "Join Our Adoption Fair",
      message: "Join us at the adoption fair this Saturday. Special discounts and many pets looking for homes!",
      type: NotificationType.promotional,
    ),
    NotificationModel(
      title: "Pet Care Tips",
      message: "Today's tip: [Pet Care Tip]. Learn more on our blog.",
      type: NotificationType.promotional,
    ),
    NotificationModel(
      title: "Adoption Success Story",
      message: "Read how [User Name] and [Pet Name] found their forever home together. Check out their story!",
      type: NotificationType.promotional,
    ),
    // Behavioral Notifications
    NotificationModel(
      title: "Similar Pets Available",
      message: "We found pets similar to [Pet Name] that might interest you. Take a look!",
      type: NotificationType.behavioral,
    ),
    NotificationModel(
      title: "New Matches for Your Search",
      message: "New pets matching your saved search criteria have been added. View them now!",
      type: NotificationType.behavioral,
    ),
    NotificationModel(
      title: "We Miss You!",
      message: "It’s been a while since you visited. Check out the new pets waiting for a home.",
      type: NotificationType.behavioral,
    ),
    NotificationModel(
      title: "Explore New Pets",
      message: "Discover new pets added to our listings today!",
      type: NotificationType.behavioral,
    ),
    // Safety and Emergency Notifications
    NotificationModel(
      title: "Product Recall Notice",
      message: "Important: A recall has been issued for [Product Name]. Please check your supply.",
      type: NotificationType.safetyEmergency,
    ),
    NotificationModel(
      title: "Health Alert",
      message: "A health alert has been issued for [Health Issue] in your area. Learn more about protecting your pet.",
      type: NotificationType.safetyEmergency,
    ),
    // Social and Community Notifications
    NotificationModel(
      title: "New Friend Request",
      message: "[User Name] wants to connect with you on the app. Accept their request now!",
      type: NotificationType.socialCommunity,
    ),
    NotificationModel(
      title: "Community Post Update",
      message: "A new post has been made in your community group: [Post Title]. Join the discussion!",
      type: NotificationType.socialCommunity,
    ),
  ];



  static  List<Map<String, dynamic>> mockWishlistData = [
    {
      "id": 1,
      "petName": "Fluffy",
      "breed": "Labrador Retriever",
      "price": 500,
      "imagePath": "assets/images/fluffy.jpg",
    },
    {
      "id": 2,
      "petName": "Bella",
      "breed": "Beagle",
      "price": 350,
      "imagePath": "assets/images/bella.jpg",
    },
    {
      "id": 3,
      "petName": "Max",
      "breed": "Golden Retriever",
      "price": 600,
      "imagePath": "assets/images/max.jpg",
    },
    {
      "id": 4,
      "petName": "Charlie",
      "breed": "German Shepherd",
      "price": 450,
      "imagePath": "assets/images/charlie.jpg",
    },
    {
      "id": 5,
      "petName": "Lucy",
      "breed": "Poodle",
      "price": 400,
      "imagePath": "assets/images/lucy.jpg",
    },
    {
      "id": 6,
      "petName": "Milo",
      "breed": "Siberian Husky",
      "price": 550,
      "imagePath": "assets/images/milo.jpg",
    },
    {
      "id": 7,
      "petName": "Luna",
      "breed": "French Bulldog",
      "price": 700,
      "imagePath": "assets/images/luna.jpg",
    },
    {
      "id": 8,
      "petName": "Rocky",
      "breed": "Boxer",
      "price": 600,
      "imagePath": "assets/images/rocky.jpg",
    },
    {
      "id": 9,
      "petName": "Daisy",
      "breed": "Shih Tzu",
      "price": 300,
      "imagePath": "assets/images/daisy.jpg",
    },
    {
      "id": 10,
      "petName": "Oscar",
      "breed": "Dachshund",
      "price": 400,
      "imagePath": "assets/images/oscar.jpg",
    },
  ];


}

enum NotificationType {
  informational,
  transactional,
  promotional,
  behavioral,
  safetyEmergency,
  socialCommunity,
}
