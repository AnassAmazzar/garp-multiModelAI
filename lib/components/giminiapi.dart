import 'package:google_generative_ai/google_generative_ai.dart';

Future<String?>funGeminiApi(String? prompt) async{
  final model = GenerativeModel(
  model: 'gemini-1.5-flash',
  apiKey: "AIzaSyC9py3yW1oqbIia3bFz4SjLN6pYmQPavvI",
  );

  final response = await model.generateContent([Content.text(prompt!)]);
  return response.text;
}