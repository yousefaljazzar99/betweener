import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/features/home/link_fast.dart';
import 'package:bootcamp_starter/input_updated_link.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/util/Api static/api_response.dart';
import 'features/Link/link_provider.dart';
import 'features/Link/model.dart';

class TCrudLinkApi extends StatefulWidget {
  const TCrudLinkApi({super.key});
  @override
  State<TCrudLinkApi> createState() => _TCrudLinkApiState();
}

class _TCrudLinkApiState extends State<TCrudLinkApi> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController linkEditingController = TextEditingController();
  TextEditingController titleEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    usernameEditingController.dispose();
    linkEditingController.dispose();
    titleEditingController.dispose();
  }

  final linkProvider = LinkProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
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
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () async {
                                await value
                                    .addLink(Links(
                                        title: "Test",
                                        link: "Test",
                                        username: "Test"))
                                    .whenComplete(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xff4B45BD).withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Delete",
                                    style: TextStyle(color: Color(0xff4B45BD))),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: links.length,
                                itemBuilder: (context, index) {
                                  return LinkShareFastWidget(
                                    title: links[index].title,
                                    urlImage: IconAssets.facebook,
                                    iconButtonCopy: IconButton(
                                        onPressed: () async {
                                          Clipboard.setData(ClipboardData(
                                              text: links[index].link));
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
                                    iconButtonEdit: IconButton(
                                        onPressed: () async {
                                          UpdateLink().openAnimatedUpdateDialog(
                                              context,
                                              "Edit",
                                              "Update Link",
                                              usernameEditingController,
                                              linkEditingController,
                                              titleEditingController,
                                              links[index], () async {
                                            Links link = links[index];
                                            link.title =
                                                titleEditingController.text;
                                            link.username =
                                                usernameEditingController.text;
                                            link.link =
                                                linkEditingController.text;

                                            await value
                                                .updateLink(Links(
                                                    id: link.id,
                                                    title: link.title,
                                                    link: link.link,
                                                    username: link.username))
                                                .whenComplete(
                                              () {
                                                Navigator.of(context).pop();

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text('Edited')),
                                                );
                                              },
                                            );
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 15,
                                        )),
                                    iconButtonDelete: IconButton(
                                        onPressed: () async {
                                          UpdateLink().openAnimatedDeleteDialog(
                                              context, 'Delete', "Are u sure?",
                                              () async {
                                            await value
                                                .deleteLink(links[index])
                                                .whenComplete(() {
                                              Navigator.of(context).pop();

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text('Deleted')),
                                              );
                                            });
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          size: 15,
                                        )),
                                  );
                                },
                              ),
                            ),
                          ],
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
                child: Text('Error: ${linkList.message}'),
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
    );
  }
}
