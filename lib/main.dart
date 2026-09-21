import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final courseController = TextEditingController();

  String result = "";
  List<Map<String, String>> students = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Student Registration"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const Text(
                "Register Your Details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Enter Your Name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Enter Your Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: "Enter Your Course",
                  prefixIcon: const Icon(Icons.school),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      courseController.text.isEmpty) {
                    setState(() {
                      result = "Please fill all fields";
                    });
                  } else {
                    setState(() {
                      students.add({
                        "name": nameController.text,
                        "email": emailController.text,
                        "course": courseController.text,
                      });
                      result = "Registration Successful!";

                      nameController.clear();
                      emailController.clear();
                      courseController.clear();
                    });
                  }
                },

                child: const Text("Register"),
              ),

              const SizedBox(height: 20),

              Text(result, style: const TextStyle(fontSize: 18)),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(students[index]["name"]!),
                        subtitle: Text(
                          "${students[index]["email"]}\n"
                          "${students[index]["course"]}",
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              students.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
