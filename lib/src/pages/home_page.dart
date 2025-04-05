import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Examples')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 2,
          children: [
            SizedBox(
              child: ElevatedButton(
                onPressed:
                    () => Navigator.of(context).pushNamed('/search_page'),
                child: Text('Search Bar Passando sem Controller'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed:
                    () => Navigator.of(context).pushNamed('/search_controller'),
                child: Text('Search Bar usando ValueNotifier'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
