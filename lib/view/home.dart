import 'package:flutter/material.dart';
import 'package:news_snack/controller/fetchnews.dart';
import 'package:news_snack/controller/newsapimodel.dart';
import 'package:news_snack/view/widgets/newcontainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FetchNew().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: FetchNew().fetchNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.sources!.length ~/ 3,
                    itemBuilder: (context, i) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NewsContainer(
                              imgUrl:
                                  "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg",
                              newsHead: snapshot.data!.sources![3 * i].name!,
                              newsDes:
                                  snapshot.data!.sources![3 * i].description!,
                              newsUrl: snapshot.data!.sources![3 * i].url!,
                            ),
                            NewsContainer(
                              imgUrl:
                                  "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg",
                              newsHead:
                                  snapshot.data!.sources![3 * i + 1].name!,
                              newsDes: snapshot
                                  .data!.sources![3 * i + 1].description!,
                              newsUrl: snapshot.data!.sources![3 * i + 1].url!,
                            ),
                            NewsContainer(
                              imgUrl:
                                  "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg",
                              newsHead:
                                  snapshot.data!.sources![3 * i + 2].name!,
                              newsDes: snapshot
                                  .data!.sources![3 * i + 2].description!,
                              newsUrl: snapshot.data!.sources![3 * i + 2].url!,
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })

        // PageView.builder(
        //     scrollDirection: Axis.vertical,
        //     itemCount: 10,
        //     itemBuilder: (context, index) {
        //       return
        //       NewsContainer(
        //         imgUrl:
        //             "",
        //         newsHead: "5G in India",
        //         newsDes:
        //             " Reliance Jio 5G services continue to expand in India. The company says its 5G services are now available in Assam's Bongaigaon, North Lakhimpur, and Sivasagar, Tinsukia. It is also rolling out to Bihar's Bhagalpur and Katihar, Goa's Mormugao, (Dadra and Nagar Haveli and Daman and Diu's Diu, and Gujarat's Gandhidham. Apart from that, Jio is rolling out 5G in Karnataka's Raichur, Madhya Pradesh's Satna, Maharashtra's Chandrapur and Ichalkaranji, and Manipur's Thoubal. Jio users in Uttar Pradesh's Faizabad, Firozabad, and Muzaffarnagar can also enjoy 5G. The connectivity option is also rolling out in Jharkhand's Bokaro Steel City, Deoghar, and Hazaribag.",
        //         newsUrl:
        //             "https://www.indiatoday.in/technology/news/story/reliance-jio-5g-available-20-new-indian-cities-full-list-2337593-2023-02-21",
        //       );
        //     }),
        );
  }
}
