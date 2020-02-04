import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data ';
  print('task 1 done ');
}

Future task2() async {
  Duration threeSce = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSce, () {
    result = 'task 2 data ';
    print('task 2 done ');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data ';
  print('task 3 done $task2Data');
}
