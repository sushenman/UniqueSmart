import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:flutter_html/flutter_html.dart';

class Payment_Policy extends StatefulWidget {
  const Payment_Policy({Key? key});

  @override
  State<Payment_Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Payment_Policy> {
  String title = '';
  String description = '';
  var document;

  @override
  void initState() {
    super.initState();
    fetchPolicyData();
  }

  Future<void> fetchPolicyData() async {
    String apiKey =
        'bC5CXYCuD1BvCbqzHS8nUkSce3zUiZJkU81KIrI72ZU6lV7p1upSc31JCEKjc6gB';
    Uri url =
        Uri.parse('https://api.uniquesmartindustries.com/api/payment-policy');

    Map<String, String> headers = {
      'apikey': apiKey,
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData is List) {
          // Handle list case if needed
        } else if (responseData is Map && responseData.containsKey('policy')) {
          title = responseData['policy'][0]['title'];
          description = responseData['policy'][0]['description'];
          document = parse(description);
          print(title);
          print(description);
          setState(() {}); // Trigger a rebuild after data is fetched
        } else {
          print('Invalid response format');
        }
      } else {
        print('Api call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text('$title', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (document != null)
                  Html(
                    data: description,
                    style: {
                      "html": Style(
                        fontSize: FontSize(
                            18.0), // Change the font size to your desired value
                            textAlign: TextAlign.justify
                      ),
                    },
                  ),
            
                // You can customize the above to handle the case when document is null
              ],
            ),
          ),
        ),
      ),
    );
  }
}
