import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	// Root of the application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter',
			theme: ThemeData(
			// Theme of the application.
			colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
			useMaterial3: true,
			),
			home: const MyHomePage(title: 'CW-1'),
		);
	}
}

// Home page of the application.
class MyHomePage extends StatefulWidget {

	const MyHomePage({super.key, required this.title});
	final String title;

	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	int _counter = 0;             // To track increment counter.
	bool _showFirstImage = true;	// To track current image state.

	void _incrementCounter() {
		setState(() {
		_counter++;					// Toogle counter
		});
	}

	void _toogleImage() {
		setState(() {
		  _showFirstImage = !_showFirstImage;	// Toogle image state
		});
	}

  void _reset() {
    setState(() {
      _showFirstImage = true;
      _counter = 0;
    });
  }

	@override
	Widget build(BuildContext context) {

		return Scaffold(

			appBar: AppBar(
				
				backgroundColor: Colors.grey,
				title: Text(widget.title),
			),
			body: Center(
				
				child: Column(
				
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						const Text(
							'You have pushed the button this many times:',
						),

						Text(
							'$_counter',
							style: Theme.of(context).textTheme.headlineMedium,
						),

						ElevatedButton(
							onPressed: _toogleImage, 
							child: Text('Toogle Image')
						),
            
            ElevatedButton(
              onPressed: _reset,
              child: Text('Reset'),
            ),

						SizedBox(
							width: 400, 
							height: 200, 
							child: _showFirstImage
							? Image.asset(
                'lib/assets/image1.png', 
                fit: BoxFit.fill,
                ) : Image.asset(
                  "lib/assets/image2.png",
                  fit: BoxFit.fill,
                  ),
						),	
					],
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: _incrementCounter,
				tooltip: 'Increment',
				child: const Icon(Icons.add),
			),
		);
	}
}
