import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/core/util/constants.dart';

import 'package:bootcamp_starter/features/home/link_fast.dart';
import 'package:bootcamp_starter/features/home/qr_widget.dart';
import 'package:bootcamp_starter/features/home/search_scan.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/util/Api static/api_response.dart';
import '../Link/link_provider.dart';
import '../Link/model.dart';

class HomeView extends StatelessWidget {
  static String id = '/homeView';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = ['Facebook', "Instagram", "WhatsApp"];
    List<String> urls = [
      IconAssets.facebook,
      IconAssets.insta,
      IconAssets.whatsapp
    ];
    final linkProvider = LinkProvider();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SearchScanContainerWidget(),
                QrWidget(),
                Container(
                  height: 400,
                  child: FutureBuilder(
                    future: linkProvider.fetchLinkList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        final linkList = linkProvider.linkList;
                        if (linkList.status == Status.COMPLETED) {
                          final links = linkList.data!;
                          if (links.isNotEmpty) {
                            return Consumer<LinkProvider>(
                              builder: (context, value, child) {
                                return Container(
                                  child: Center(
                                    child: Expanded(
                                      child: ListView.builder(
                                        itemCount: links.length,
                                        itemBuilder: (context, index) {
                                          return LinkShareFastWidget(
                                            title: links[index].title,
                                            urlImage: IconAssets.facebook,
                                            iconButtonCopy: IconButton(
                                                onPressed: () async {
                                                  Clipboard.setData(
                                                      ClipboardData(
                                                          text: links[index]
                                                              .link));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            'Copied to clipboard')),
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.copy,
                                                  size: 15,
                                                )),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Container(
                              child: Text('No links found'),
                            );
                          }
                        } else if (linkList.status == Status.ERROR) {
                          return Container(
                            child: Text(
                              'Oops.. something wrong',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 20),
                            ),
                          );
                        } else {
                          return Container(
                            child: Text('Loading...'),
                          );
                        }
                      } else {
                        // Show a loading indicator
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
