import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garp/components/header/MenuBarWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:html' as html;

import 'package:tflite_web/tflite_web.dart';

class ConvolutionNetwork extends StatefulWidget {
  const ConvolutionNetwork({super.key});

  @override
  State<ConvolutionNetwork> createState() => _ConvolutionNetworkState();
}

class _ConvolutionNetworkState extends State<ConvolutionNetwork> {
  TFLiteModel? _tfLiteModel;
  static const String modelPath = 'assets/model/fruit_model.tflite';
  static const String labelsPath = 'assets/model/labels.txt';
  String? _predictions_response;

  String? _imageDataUrl;
  File? _selectedImage = File("/images/fruit&legume.jpg");
  File? _slcImg;
  Uint8List _webImage = Uint8List(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MenuBarWidget(
              title: "Artificial Neural Network", centerTitle: true)),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Row(children: [
              Column(children: [
                _imageDataUrl != null
                    ? Image.memory(
                        _webImage!,
                        height: 500,
                        width: 500,
                      )
                    : Image.asset(_selectedImage!.path,
                        height: 500, width: 500),
                const SizedBox(height: 20),
                _predictions_response != null
                    ? Center(
                      child: Container(
                        width: 300,
                        height: 60,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 250, 177, 67),
                            borderRadius: BorderRadius.circular(8.0)),
                            alignment: Alignment.center,
                        child: Center(
                          child: Text("${_predictions_response}",
                              style: TextStyle(
                                  color: Colors.blue[900], fontSize: 18.0,
                                  fontWeight: FontWeight.bold,)),
                        ))
                    )
                    : Text("")
              ]),
              const SizedBox(width: 30),
              Column(
                children: [
                  const Text(
                      'Veuillez télécharger une image pour vérifier si elle correspond à un légume ou à un fruit.\nAssurez-vous que l\'image est claire et bien cadrée, montrant uniquement \nl\'objet que vous souhaitez analyser.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 20),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                          color: Colors.blueAccent,
                          onPressed: () {
                            _pickImageFromGallery();
                            //makePostRequest();
                          },
                          child: const Text("Pick up image from gallery",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      MaterialButton(
                          color: Colors.red,
                          onPressed: () {
                            _pickImageFromGallery();
                          },
                          child: const Text("Pick up image from camera",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    ],
                  ))
                ],
              )
            ]),
          ),
        ],
      )),
    );
  }

  Future _pickImageFromGallery() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? _returnedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (_returnedImage != null) {
        var selectedFile = File(_returnedImage.path);
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? _returnedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (_returnedImage != null) {
        var fileImg = await _returnedImage.readAsBytes();
        setState(() {
          //_selectedImage = _returnedImage
          _webImage = fileImg;
          _imageDataUrl = ('data:image/png;base64,${base64Encode(_webImage)}');
          //print(_imageDataUrl);
        });
        makePostRequest();
      }
      //print(kIsWeb);
    }
  }

  Future<void> makePostRequest() async {
    String url = "http://localhost:5000/api/cnn-upload-image";
    final headers = {'Content-Type': 'multipart/form-data'};
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    final response = await http.post(Uri.parse(url));
    List<int> list = _webImage.cast();
    request.files
        .add(http.MultipartFile.fromBytes('image', list, filename: 'img.png'));
    http.StreamedResponse r = await request.send();
    var res = '';
    var finalstring = await r.stream.transform(utf8.decoder).join();
    var hh = finalstring.split(":");
    String ans = hh[1];
    var array = ans.split('');
    array.forEach((element) {
      if (element != "'" &&
          element != "[" &&
          element != "[" &&
          element != '"' &&
          element != "}") {
        res += element;
      }
    });
    setState(() {
      _predictions_response = res;
    });
  }
}
