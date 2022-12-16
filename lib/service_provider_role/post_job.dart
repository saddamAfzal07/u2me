import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart';
import 'package:u2me/constants/app_url.dart';
import 'package:u2me/constants/colors/colors.dart';
import 'package:u2me/constants/widgets/button_item.dart';
import 'package:u2me/constants/widgets/padding.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:u2me/pages/dashboard_screen/home_page_category_screen.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

import 'package:image_picker/image_picker.dart';

import '../constants/userinfo.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController jobTitle = TextEditingController();

  TextEditingController shortDescription = TextEditingController();
  TextEditingController longDescription = TextEditingController();
  TextEditingController budget = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController serviceCode = TextEditingController();
  TextEditingController jobDeadLine = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();

  List<XFile> imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }

    setState(() {});
  }

  void removeImages(path) {
    imageFileList.remove(path);
    setState(() {});
  }

  // Date picker
  String selectedDate = "";
  selectDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.primary, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColor.primary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime(2101),
    );

    const Locale("en");
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        selectedDate = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  ///Auto Complete Api
  final TextEditingController _controller = TextEditingController();

  var uuid = const Uuid();
  String _sessiontoken = "12345";
  List<dynamic> _placesList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      onChange();
    });
    _getlistCategories();
  }

  void onChange() {
    if (_sessiontoken == null) {
      setState(() {
        _sessiontoken = uuid.v4();
      });
    } else {
      getSuggestion(_controller.text);
    }
  }

  getSuggestion(String input) async {
    print("get Suggestion");
    String Kplaces_Api_key = "AIzaSyD0FF3AAoxna0JdnyLObJBkXw05YIOeJsI";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$Kplaces_Api_key&sessiontoken=$_sessiontoken';

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    print(data);
    if (response.statusCode == 200) {
      print("Get==> 200");

      setState(() {
        _placesList = jsonDecode(response.body.toString())["predictions"];
      });
    } else {
      throw Exception("Failed to load data");
    }
  }

  String? address = "Enter to Select Address";
  double? longitudeAddress;
  double? latitudeAddress;

  List? categoryList;
  String? mySelectedId;
  _getlistCategories() async {
    String token = UserInfo.token;
    await http.get(Uri.parse("${AppUrl.baseUrl}all/categories"), headers: {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    }).then((response) {
      var data = jsonDecode(response.body);
      setState(() {
        categoryList = data["response"];
      });
    });
  }

  uploadData() async {
    String token = UserInfo.token;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // ignore: unnecessary_new
    final multipartRequest = new http.MultipartRequest(
        "POST", Uri.parse("${AppUrl.baseUrl}create/job"));
    multipartRequest.headers.addAll(headers);

    multipartRequest.fields.addAll({
      'job_title': jobTitle.text,
      'short_description': shortDescription.text,
      'long_description': longDescription.text,
      "category_id": 12.toString(),
      "budget": budget.text.toString(),
      "lat": latitudeAddress.toString(),
      "long": longitudeAddress.toString(),
      "service_code": serviceCode.text.toString(),
    });

    multipartRequest.files.add(
      await http.MultipartFile.fromPath('images', image!.path),
    );
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();
    print(response);

    if (response.statusCode == 200) {
      print("success");
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CategoryHomepage()));
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //       builder: (BuildContext context) => const CategoryHomepage(),
      //     ),
      //     (Route<dynamic> route) => false);
    } else {}
  }

  File? image;

  final _picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.background,
        actions: [
          Image.asset(
            "assets/images/drawer.png",
            // width: 7,
            // height: 12,
          ),
        ],
        leading: Image.asset(
          "assets/images/backarrow.png",
          width: 7,
          height: 12,
        ),
        title: const Text(
          "Ugradnja parketa",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              padding16,
              const Text(
                "Post a job",
                style: TextStyle(
                  fontSize: 15.0,
                  color: AppColor.white,
                ),
              ),
              padding24,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      padding24,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: jobTitle,
                        cursorColor: AppColor.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 23, maxHeight: 20),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Image.asset(
                              "assets/images/question.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                          hintText: "Your job",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      padding16,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: shortDescription,
                        cursorColor: AppColor.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 23, maxHeight: 20),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Image.asset(
                              "assets/images/document.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                          hintText: "Short Description",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      padding24,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.white),
                        ),
                        alignment: Alignment.topCenter,
                        child: TextFormField(
                          maxLines: 5,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          controller: longDescription,
                          cursorColor: AppColor.white,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColor.white),
                            ),
                            hintText: "Long Description",
                            hintStyle: TextStyle(
                              color: AppColor.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      padding20,
                      image == null
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Image.file(
                                File(image!.path).absolute,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                      padding20,
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // selectImages();
                                      getImage();
                                    },
                                    child: Image.asset(
                                      "assets/images/camera.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  padding16,
                                  const Text(
                                    "Add picture",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          padding12,
                          Container(
                            height: 1.2,
                            color: AppColor.white,
                          ),
                        ],
                      ),
                      padding16,
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/category.png",
                            height: 15,
                            width: 20,
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  dropdownColor: AppColor.background,
                                  value: mySelectedId,
                                  isExpanded: true,
                                  iconSize: 30,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColor.white,
                                  ),
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  hint: const Text(
                                    "Select Category",
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      mySelectedId = newValue.toString();

                                      _getlistCategories();
                                      print(mySelectedId);
                                    });
                                  },
                                  items: categoryList?.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(item['category_name']),
                                          value: item['id'].toString(),
                                        );
                                      }).toList() ??
                                      [],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColor.white,
                        thickness: 1.5,
                      ),
                      padding32,
                      GestureDetector(
                        onTap: () {
                          selectDate(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectDate(context);
                                  },
                                  child: Image.asset(
                                    "assets/images/calender.png",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                padding16,
                                Text(
                                  selectedDate == ""
                                      ? "Select Date"
                                      : selectedDate,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Text("")
                          ],
                        ),
                      ),
                      padding12,
                      Container(
                        height: 1.2,
                        color: AppColor.white,
                      ),
                      padding16,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: budget,
                        cursorColor: AppColor.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 23, maxHeight: 20),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                            ),
                            child: Image.asset(
                              "assets/images/dollar.png",
                              height: 15,
                              width: 20,
                            ),
                          ),
                          hintText: "Budget \$ 50-85",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      // padding16,
                      // TextFormField(
                      //   style: const TextStyle(color: Colors.white),
                      //   controller: location,
                      //   cursorColor: AppColor.white,
                      //   keyboardType: TextInputType.emailAddress,
                      //   decoration: InputDecoration(
                      //     prefixIconConstraints:
                      //         const BoxConstraints(minWidth: 23, maxHeight: 20),
                      //     enabledBorder: const UnderlineInputBorder(
                      //       borderSide: BorderSide(color: AppColor.white),
                      //     ),
                      //     focusedBorder: const UnderlineInputBorder(
                      //       borderSide: BorderSide(color: AppColor.white),
                      //     ),
                      //     prefixIcon: Padding(
                      //       padding: const EdgeInsets.only(right: 10),
                      //       child: Image.asset(
                      //         "assets/images/location.png",
                      //         height: 15,
                      //         width: 20,
                      //       ),
                      //     ),
                      //     hintText: "Job Location",
                      //     hintStyle: const TextStyle(
                      //       color: AppColor.white,
                      //       fontSize: 14,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: _controller,
                        decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 23, maxHeight: 20),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              "assets/images/location.png",
                              height: 15,
                              width: 20,
                            ),
                          ),
                          hintText: address,
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _placesList.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            onTap: () async {
                              List<Location> locations =
                                  await locationFromAddress(
                                      _placesList[index]["description"]);
                              setState(() {
                                address = _placesList[index]["description"];
                                longitudeAddress = locations.last.longitude;
                                latitudeAddress = locations.last.latitude;
                                // print(
                                //    " longitudeAddress + " " + LatitudeAddress");
                              });
                              _controller.clear();
                            },
                            title: Text(
                              _placesList[index]["description"],
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                      ),
                      padding16,
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: serviceCode,
                        cursorColor: AppColor.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 23, maxHeight: 20),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.white),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              "assets/images/dollar.png",
                              height: 15,
                              width: 20,
                            ),
                          ),
                          hintText: "Service Code",
                          hintStyle: const TextStyle(
                            color: AppColor.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              padding16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonItem(
                    text: "SKIP",
                    onTap: () {},
                    width: 170,
                  ),
                  padding2,
                  ButtonItem(
                    text: "ADD",
                    onTap: () {
                      final isvalid = _formKey.currentState!.validate();
                      if (isvalid &&
                          latitudeAddress != null &&
                          latitudeAddress != null &&
                          image != null) {
                        uploadData();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                const Text("Each Category must be Selected"),
                            backgroundColor: Colors.grey.shade500,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    width: 170,
                  ),
                ],
              ),
              padding16,
            ],
          ),
        ),
      ),
    );
  }
}
