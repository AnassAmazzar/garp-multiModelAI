// import 'package:flutter/services.dart';
// import 'package:tflite_web/tflite_web.dart';
// // import 'package:tflite_flutter/tflite_flutter.dart';

// class FruitClassificationModel {
//   TFLiteModel? _tfLiteModel;
//   static const String modelPath = 'assets/model/fruit_model.tflite';
//   static const String labelsPath = 'assets/model/labels.txt';

//   bool _isModelLoaded = false;
//   // FruitClassifierService(){
//   //   _loadModel();
//   //   _loadLabels();
//   // }

//   Future<void> _loadModel() async {
//     try {
//       TFLiteWeb.initialize().then((onValue) async {
//         _tfLiteModel = await TFLiteModel.fromUrl(modelPath);
//       });
//       print('Modèle chargé avec succès');
//     } catch (e) {
//       print('Erreur lors du chargement du modèle: $e');
//     }
//   }

//   // void _loadLabels() async {
//   //   final labelsData = await rootBundle.loadString('assets/model/label.txt');
//   //   _labels = labelsData.split('\n');
//   // }

// }