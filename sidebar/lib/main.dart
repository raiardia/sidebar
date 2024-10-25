import 'package:flutter/material.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;
        return Scaffold(
          drawer: isDesktop
              ? null
              : Drawer(
                  child: SidebarContent(),
                ),
          body: Row(
            children: [
              // Sidebar hanya muncul jika layar besar
              if (isDesktop)
                Container(
                  width: 250,
                  color: Colors.teal[700],
                  child: SidebarContent(),
                ),
              // Main Content
              Expanded(
                child: Column(
                  children: [
                    // Header
                    Container(
                      color: Colors.teal,
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!isDesktop)
                            Builder(
                              builder: (context) => IconButton(
                                icon: Icon(Icons.menu, color: Colors.white),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                              ),
                            ),
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.search, color: Colors.white),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.notifications,
                                    color: Colors.white),
                                onPressed: () {},
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/300',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Main Content Area
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // About Me Section
                              Text(
                                'About Me',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Hello! I am [Your Name], a passionate developer with experience in Flutter, Web Development, and UI/UX Design. '
                                'I love creating beautiful and functional applications that solve real-world problems.',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[800]),
                              ),
                              Divider(),
                              // Projects Section
                              Text(
                                'Projects',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: [
                                  ProjectCard(
                                    title: 'Project 1',
                                    description: 'Description of Project 1.',
                                  ),
                                  ProjectCard(
                                    title: 'Project 2',
                                    description: 'Description of Project 2.',
                                  ),
                                  ProjectCard(
                                    title: 'Project 3',
                                    description: 'Description of Project 3.',
                                  ),
                                ],
                              ),
                              Divider(),
                              // Contact Section
                              Text(
                                'Contact',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Feel free to reach out if you have any questions or if you are interested in working together!',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[800]),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Email: your.email@example.com',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.teal),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'LinkedIn: linkedin.com/in/yourprofile',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.teal),
                              ),
                            ],
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
      },
    );
  }
}

// Sidebar Content
class SidebarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'My Portfolio',
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 146, 58),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(color: Colors.white54),
        NavButton(label: 'About Me', onTap: () {}),
        NavButton(label: 'Projects', onTap: () {}),
        NavButton(label: 'Contact', onTap: () {}),
      ],
    );
  }
}

// Sidebar Navigation Button Widget
class NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Text(
            label,
            style: TextStyle(color: const Color.fromARGB(255, 1, 63, 33), fontSize: 18),
          ),
        ),
      ),
    );
  }
}

// Project Card Widget
class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
