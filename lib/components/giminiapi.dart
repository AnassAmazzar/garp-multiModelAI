import 'package:google_generative_ai/google_generative_ai.dart';

Future<String?>funGeminiApi(String? prompt) async{
  final model = GenerativeModel(
  model: 'gemini-1.5-flash',
  apiKey: "Key",
  );

  final response = await model.generateContent([Content.text(prompt!)]);
  return response.text;
}