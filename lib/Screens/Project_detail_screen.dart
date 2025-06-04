import 'package:flutter/material.dart';
import '../models/Capa_module.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  Widget buildInfoTile(
      {required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final start = project.startDate.toLocal().toString().split(' ')[0];
    final end = project.endDate.toLocal().toString().split(' ')[0];

    return Scaffold(
      appBar: AppBar(title: Text(project.projectName)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoTile(
                        icon: Icons.account_tree,
                        label: 'Department',
                        value: project.departmentName,
                      ),
                      buildInfoTile(
                        icon: Icons.description,
                        label: 'Description',
                        value: project.projectDescription,
                      ),
                      buildInfoTile(
                        icon: Icons.date_range,
                        label: 'Start Date',
                        value: start,
                      ),
                      buildInfoTile(
                        icon: Icons.event,
                        label: 'End Date',
                        value: end,
                      ),
                      buildInfoTile(
                        icon: Icons.location_on,
                        label: 'Location',
                        value: '${project.district}, ${project.state}',
                      ),
                      buildInfoTile(
                        icon: Icons.account_balance,
                        label: 'Authority',
                        value: project.authorityName,
                      ),
                      buildInfoTile(
                        icon: Icons.business,
                        label: 'Organization',
                        value: project.organization,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.feedback),
                    label: const Text('Complain'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.comment),
                    label: const Text('Comment'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
