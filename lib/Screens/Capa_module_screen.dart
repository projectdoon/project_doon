import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Providers/auth_provider.dart';
import '../models/Capa_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Project_detail_screen.dart';

class ProjectsScreen extends ConsumerStatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends ConsumerState<ProjectsScreen> {
  late final String? token;
  List<Project> projects = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    token = ref.read(tokenProvider);
    super.initState();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    final url =
        Uri.parse('http://192.168.177.94:8000/api/projects/getAllProjects');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        final List<Project> loadedProjects =
            jsonData.map((jsonItem) => Project.fromJson(jsonItem)).toList();

        setState(() {
          projects = loadedProjects;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Server error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load projects: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage != null) {
      return Scaffold(
        body: Center(child: Text(errorMessage!)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProjectDetailScreen(project: project),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.projectName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.apartment,
                              size: 16, color: Colors.blueGrey),
                          const SizedBox(width: 8),
                          Text(project.departmentName),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.redAccent),
                          const SizedBox(width: 8),
                          Text('${project.district}, ${project.state}'),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.date_range,
                              size: 16, color: Colors.green),
                          const SizedBox(width: 8),
                          Text(
                              'From ${project.startDate.toLocal().toString().split(' ')[0]}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
