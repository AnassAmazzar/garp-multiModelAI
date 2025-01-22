import 'package:flutter/material.dart';
//import 'package:garp/components/CommonScaffold.dart';
import 'package:garp/components/giminiapi.dart';
import 'package:garp/components/header/MenuBarWidget.dart';
import 'package:garp/components/header/NavBarWidget.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VocalAsistant extends StatefulWidget {
  const VocalAsistant({super.key});

  @override
  State<VocalAsistant> createState() => _MyVocalAsistant();
}

class _MyVocalAsistant extends State<VocalAsistant> {
  final SpeechToText _speechToText = SpeechToText();
  String _lastWords = '';
  String gimini_resp = '';
  bool _speechEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MenuBarWidget(title: "Vocal Asistant", centerTitle: true)),
      //endDrawer: const NavBarWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset("/images/vocal_asistante.jpg"),
          const SizedBox(height: 30),
          TextField(
            enabled: false,
            controller: TextEditingController(
                text: _speechToText.isListening
                    ? "$_lastWords"
                    : "Welcom to our chatbot"),
            decoration: InputDecoration(
              labelText: 'Entrez votre texte',
              hintText: _speechToText.isListening
                  ? "$_lastWords"
                  : "Welcom to our chatbot",
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue.shade200, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue.shade200, width: 2),
              ),
              prefixIcon: const Icon(Icons.edit, color: Colors.blue),
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            enabled: false,
            maxLines: null,
            keyboardType: TextInputType.multiline, // Désactive l'édition
            controller:
                TextEditingController(text: gimini_resp), // Texte de sortie
            decoration: InputDecoration(
              labelText: 'Résultat',
              labelStyle: TextStyle(color: Colors.blue.shade600),
              filled: true,
              fillColor: const Color.fromARGB(255, 250, 177, 67),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue.shade600, width: 2),
              ),
              prefixIcon: Icon(Icons.output, color: Colors.blue.shade600),
            ),
            style: TextStyle(color: Colors.blue.shade600),
          ),
          const SizedBox(height: 50),
          // _speechToText.isListening? Text("$_lastWords"):Text("Welcom to our chatbot"),
          // Text(gimini_resp)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _speechToText.isListening ? _stopListening() : _startListening();
          gimini_resp = (await funGeminiApi(_lastWords))!;
          setState(() {});
        },
        child: Icon(_speechToText.isListening ? Icons.stop : Icons.mic,
            color: Colors.red),
      ),
    );
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }
}
