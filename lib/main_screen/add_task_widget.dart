import 'package:flutter/material.dart';
import 'package:uptodo/models/tasks.dart';

class TaskAddScreenWidget extends StatelessWidget {
  final Function(int) onDelete;
  final List<Task> tasks;

  final String Function(DateTime) formatDate;
  const TaskAddScreenWidget({
    super.key,
    required this.tasks,
    required this.onDelete,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            tileColor: const Color.fromARGB(255, 100, 100, 100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.only(left: 5),
            title: Text(
              task.text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
              formatDate(task.createdAt), // ✅ показываем время
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            trailing: IconButton(
              onPressed: () {
                onDelete(index);
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}

Future<String?> showTaskDialog(BuildContext context) {
  final TextEditingController controller = TextEditingController();
  return showDialog<String>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Color.fromARGB(255, 100, 100, 100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Edit Task title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Container(height: 1, color: Colors.grey),
              SizedBox(height: 20),
              TextField(
                autofocus: true,
                maxLines: 1,
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  isDense: true,
                  counterStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 37.5, vertical: 10),
                      ),

                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            4,
                          ), // 👈 минимальное скругление
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(null),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xFF8875FF), fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 52.5, vertical: 10),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xFF8875FF),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            4,
                          ), // 👈 минимальное скругление
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context, controller.text),
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
