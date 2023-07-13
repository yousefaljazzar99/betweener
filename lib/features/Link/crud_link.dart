import 'package:bootcamp_starter/core/util/assets.dart';
import 'package:bootcamp_starter/features/home/link_fast.dart';
import 'package:bootcamp_starter/input_updated_link.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/util/Api static/api_response.dart';
import 'link_provider.dart';
import 'model.dart';

class CrudLinkApi extends StatefulWidget {
  const CrudLinkApi({super.key});
  @override
  State<CrudLinkApi> createState() => _CrudLinkApiState();
}

class _CrudLinkApiState extends State<CrudLinkApi> {
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

  @override
  Widget build(BuildContext context) {
    final linkProvider = LinkProvider();
    return Scaffold(
      body: FutureBuilder(
        future: linkProvider.fetchLinkList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final linkList = linkProvider.linkList;
            if (linkList.status == Status.COMPLETED) {
              final links = linkList.data!;
              if (links.isNotEmpty) {
                return Container(
                  child: Center(
                    child: ListView.builder(
                      itemCount: links.length,
                      itemBuilder: (context, index) {
                        return Consumer<LinkProvider>(
                          builder: (context, consumerLinkProvider, child) {
                            return LinkShareFastWidget(
                              title: links[index].title,
                              urlImage: IconAssets.facebook,
                              iconButtonCopy: IconButton(
                                  onPressed: () async {
                                    Clipboard.setData(
                                        ClipboardData(text: links[index].link));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Copied to clipboard')),
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
                                      link.title = titleEditingController.text;
                                      link.username =
                                          usernameEditingController.text;
                                      link.link = linkEditingController.text;

                                      await consumerLinkProvider
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
                                            SnackBar(content: Text('Edited')),
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
                                      await consumerLinkProvider
                                          .deleteLink(links[index])
                                          .whenComplete(() {
                                        Navigator.of(context).pop();

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(content: Text('Deleted')),
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
                        );
                      },
                    ),
                  ),
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
