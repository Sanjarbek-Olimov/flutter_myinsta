import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/model/post_model.dart';
import 'package:flutter_myinsta/services/auth_service.dart';
import 'package:image_picker/image_picker.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  List<Post> items = [];
  String post_img1 =
      "https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost.png?alt=media&token=f0b1ba56-4bf4-4df2-9f43-6b8665cdc964";
  String post_img2 =
      "https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost2.png?alt=media&token=ac0c131a-4e9e-40c0-a75a-88e586b28b72";
  int axisCount = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Post(
        postImage: post_img1,
        caption: "Discover more great images on our sponsor's site"));
    items.add(Post(
        postImage: post_img2,
        caption: "Discover more great images on our sponsor's site"));
  }

  File? _image;

  _imgFromGalleryCamera(source) async {
    XFile? image =
        await ImagePicker().pickImage(source: source, imageQuality: 50);
    setState(() {
      _image = File(image!.path);
    });
  }

  void bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    _imgFromGalleryCamera(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Pick Photo"),
                ),
                ListTile(
                  onTap: () {
                    _imgFromGalleryCamera(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Take Photo"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Profile",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontFamily: "Bluevinyl"),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              AuthService.signOutUser(context);
            }, icon: const Icon(Icons.exit_to_app, color: Colors.black87,))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            children: [
              // #myphoto
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(
                            width: 1.5,
                            color: const Color.fromRGBO(193, 53, 132, 1))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: _image == null
                          ? Image.asset(
                              "assets/images/img.png",
                              width: 70,
                              height: 70,
                            )
                          : Image.file(
                              _image!,
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: bottomSheet,
                          child: const Icon(
                            Icons.add_circle,
                            color: Colors.purple,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              // #myinfos
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sanjarbek".toUpperCase(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "SanjarbekOlimov@gmail.com",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),

              // #mycounts
              Container(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "675",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "POSTS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    )),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "4,565",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "FOLLOWERS",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    )),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "897",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "FOLLOWING",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),

              // #gridselect
              Container(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: IconButton(
                      onPressed: () {
                        setState(() {
                          axisCount = 1;
                        });
                      },
                      icon: const Icon(
                        Icons.list_alt,
                        size: 27,
                      ),
                    ))),
                    Expanded(
                        child: Center(
                            child: IconButton(
                      onPressed: () {
                        setState(() {
                          axisCount = 2;
                        });
                      },
                      icon: const Icon(
                        Icons.grid_view,
                        size: 27,
                      ),
                    ))),
                  ],
                ),
              ),

              Expanded(
                  child: GridView.builder(
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: axisCount),
                      itemBuilder: (context, index) {
                        return _itemOfPost(items[index]);
                      }))
            ],
          ),
        ));
  }

  Widget _itemOfPost(Post post) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              width: double.infinity,
              imageUrl: post.postImage,
              placeholder: (context, url) =>
                  const CircularProgressIndicator.adaptive(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            post.caption,
            style: TextStyle(color: Colors.black87.withOpacity(0.7)),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
