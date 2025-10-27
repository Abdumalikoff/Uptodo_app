import 'package:flutter/material.dart';
import 'package:uptodo/main_screen/add_task_widget.dart';

import 'package:uptodo/main_screen/profile_widget.dart';
import 'package:uptodo/models/tasks.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  List<Task> tasks = [];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _formatDate(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(dt.day)}.${two(dt.month)}.${dt.year} ${two(dt.hour)}:${two(dt.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = [
      tasks.isEmpty
          ? const NoTaskWidget()
          : TaskAddScreenWidget(
              tasks: tasks,
              onDelete: (index) {
                setState(() {
                  tasks.removeAt(index); // удаляем задачу по индексу
                });
              },
              formatDate: _formatDate,
            ),
      ProfileScreenWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'UpToDo',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Color(0xFF8875FF),
          onPressed: () async {
            final text = await showTaskDialog(context);
            if (text != null && text.isNotEmpty) {
              setState(() {
                tasks.add(Task(text: text));
              });
            }
          },
          child: Icon(Icons.add, color: Colors.white, size: 36),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 100, 100, 100),
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NoTaskWidget extends StatelessWidget {
  const NoTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(height: 30),
          Image.asset('image/main_page/main.png'),
          Text(
            'What do you want to do today?',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Tap + to add your tasks',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
