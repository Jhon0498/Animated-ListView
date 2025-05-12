import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated ListView Demo',
      home: const AnimatedListScreen(),
    );
  }
}

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({super.key});

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = [];

  int _counter = 0;

  void _addItem() {
    final String newItem = 'Item ${_counter++}';
    _items.insert(0, newItem);
    _listKey.currentState?.insertItem(
      0,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated ListView')),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: Card(child: ListTile(title: Text(_items[index]))),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
