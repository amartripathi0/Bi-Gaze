// ignore_for_file: deprecated_member_use

import 'package:cool_card_swiper/card/cool_swiper.dart';
import 'package:flutter/material.dart';
import 'common/widget/appbar.dart';
<<<<<<< HEAD
import '../page/home_page.dart';
=======
>>>>>>> appv2

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CommonAppBar(title: "Notification"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 100),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: deviceWidth < 398 ? 345 : 400,
                alignment: Alignment.topCenter,
                child: CoolSwiper(
                  initAnimationOffset: 20,
                  children: List.generate(
                    getCardList().length,
                    (index) => CardContent(
                      cardItem: getCardList()[index],
                      deviceWidth: deviceWidth,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<CardModel> getCardList() {
  final List<CardModel> cardList = [
    CardModel("Mellat", 80, 6059, "12/26",
        "assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png", Colors.red),
    CardModel(
        "Master",
        100,
        2012,
        "11/19",
        "assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png",
        Colors.yellow.shade700),
    CardModel(
        "PayPal",
        20,
        7923,
        "02/05",
        "assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png",
        Colors.blue),
    CardModel(
        "Visa",
        270,
        9881,
        "07/22",
        "assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png",
        Colors.green),
    CardModel("Mellat", 80, 6059, "12/26",
        "assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png", Colors.red),
    CardModel(
        "Master",
        100,
        2012,
        "11/19",
        "assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png",
        Colors.yellow.shade700),
    CardModel(
        "PayPal",
        20,
        7923,
        "02/05",
        "assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png",
        Colors.blue),
    CardModel(
        "Visa",
        270,
        9881,
        "07/22",
        "assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png",
        Colors.green),
  ];
  return cardList;
}

class CardModel {
  final String bankName;
  final double accountBalance;
  final int lastCardNumber;
  final String expireDate;
  final String bankImage;
  final Color cardColor;

  CardModel(this.bankName, this.accountBalance, this.lastCardNumber,
      this.expireDate, this.bankImage, this.cardColor);
}

class TransactionModel {
  final String title;
  final int price;
  final String date;
  final bool isSent;

  TransactionModel(this.title, this.price, this.date, this.isSent);
}

class CardContent extends StatelessWidget {
  final CardModel cardItem;
  final double deviceWidth;
  const CardContent(
      {super.key, required this.cardItem, required this.deviceWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 200,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: cardItem.cardColor),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      cardItem.bankImage,
                      height: 30,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                    const Text(
                      "IMPORTANT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                  left: deviceWidth < 350 ? 10 : 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7,
                      width: 215,
                      child: ListView.builder(
                        itemCount: 12,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(
                                right: (index + 1) % 4 == 0 ? 26 : 8),
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        cardItem.lastCardNumber.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.only(right: 20, left: 24, bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${cardItem.accountBalance}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      Text(
                        cardItem.expireDate,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
