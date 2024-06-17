import 'package:bark_buddy/services/dataRepository/mockDataRepository.dart';
import 'package:bark_buddy/utils/appColors.dart';
import 'package:flutter/material.dart';

import '../components/customAppBar.dart';
import '../gen/assets.gen.dart';
import '../utils/appTextStyles.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Notifications",
        prefixIcon: null,
        showBackButton: false,
        showPrefixIcon: true,
        onPrefixIconPressed: () {},
      ),
    body: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: MockDataRepository.notifications.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 0, bottom: 20,top: 0),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.colorForNotificationType(MockDataRepository.notifications[index].type),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 55,
                        width: 55,
                        child: Center(
                          child: Image.asset(
                            _buildIconForType(MockDataRepository.notifications[index].type),
                            height: 25,
                            width: 25,
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MockDataRepository.notifications[index].title,
                              style: AppTextStyles.poppinsSemiBold(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              MockDataRepository.notifications[index].message,
                              style: AppTextStyles.poppinsRegular(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5,),

                  Divider(color: Colors.grey.shade400,thickness: 1,)
                ],
              ),
            );
          },
        ),
         
      ],
      ),
    ),);
  }

  String _buildIconForType(NotificationType type) {
    switch (type) {
      case NotificationType.informational:
        return Assets.images.notification.info.path;
      case NotificationType.transactional:
        return Assets.images.notification.transaction.path;
      case NotificationType.promotional:
        return Assets.images.notification.promotions.path;
      case NotificationType.behavioral:
        return Assets.images.notification.deal.path;
      case NotificationType.safetyEmergency:
        return Assets.images.notification.safety.path;
      case NotificationType.socialCommunity:
        return Assets.images.notification.community.path;
      default:
        return Assets.images.notification.info.path;
    }
  }
}
