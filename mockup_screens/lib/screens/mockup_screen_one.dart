import 'package:flutter/material.dart';

class MockupScreenOne extends StatefulWidget {
  const MockupScreenOne({super.key, required this.title});
// Defining the initial state
  final String title;

  @override
  State<MockupScreenOne> createState() => _MockupScreenOneState();
}

class _MockupScreenOneState extends State<MockupScreenOne> {
  // Set initial index to 1 for Movies
  int _selectedIndex = 1;

  // Define a simple Movie data structure
  static const List<Map<String, String>> popularMovies = [
    {
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU7zpKkWlY1gayHYtmPyPbPT0ffQOXky5VUg&s',
      'title': 'Exit',
      'year': '2019',
      'category': 'Action, Comedy',
      'description': 'John Wick is on the run aafter killing a member',
    },
  ];

  // Define widgets for each tab
  static final List<Widget> _widgetOptions = <Widget>[
    // Home Screen Content
    const Center(child: Text('Index 0: Home Content')),
    // Movies Screen Content
    _MoviesContent(popularMovies: popularMovies),
    // Bookmark Screen Content
    const Center(child: Text('Index 2: Bookmark Content')),
    // Account Screen Content
    const Center(child: Text('Index 3: Account Content')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        // Use Column to stack the header and content
        children: <Widget>[
          // New Header Section
          Container(
            color: Colors.purple, // Purple background
            padding: const EdgeInsets.all(16.0), // Add some padding
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the start
              children: <Widget>[
                const Text(
                  'Discover & Enjoy your favorite movies',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Make text readable on purple
                  ),
                ),
                const SizedBox(
                    height: 16), // Space between heading and search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search movies...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none, // No border line
                    ),
                    filled: true,
                    fillColor: Colors.white, // White background for search bar
                  ),
                ),
                const SizedBox(height: 16), // Space between search bar and row
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Distribute items
                  children: <Widget>[
                    Row(
                      // Group sort and filter
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            // TODO: Implement sort functionality
                          },
                          icon: const Icon(Icons.sort, color: Colors.white),
                          label: const Text('Sort',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 8),
                        TextButton.icon(
                          onPressed: () {
                            // TODO: Implement filter functionality
                          },
                          icon: const Icon(Icons.filter_list,
                              color: Colors.white),
                          label: const Text('Filter',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    // Placeholder for 'logo tmd'
                    const Text('TMD Logo',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.bold)), // Using Text as placeholder
                  ],
                ),
              ],
            ),
          ),
          // Existing content (expanded to take remaining space)
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 255, 55),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Widget to display the Movies content
class _MoviesContent extends StatelessWidget {
  const _MoviesContent({required this.popularMovies});

  final List<Map<String, String>> popularMovies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Popular Section
            const Text(
              'Popular',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // List of Popular Movies
            ListView.builder(
              shrinkWrap:
                  true, // Important for ListView inside Column/SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(), //
              itemCount: popularMovies.length,
              itemBuilder: (context, index) {
                final movie = popularMovies[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Thumbnail Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            movie['imageUrl']!,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 100,
                                height: 150,
                                color: Colors.grey,
                                child: const Icon(Icons.error,
                                    color: Colors.white),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Movie Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie['title']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text('Year: ${movie['year']}'),
                              const SizedBox(height: 4),
                              Text(
                                movie['description']!,
                                maxLines: 3, // Limit description lines
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if it overflows
                              ),
                              const SizedBox(height: 4),
                              Text('Category: ${movie['category']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24), // Space between sections

            // Upcoming Section (Placeholder)
            const Text(
              'Upcoming',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Center(child: Text('Upcoming movies list goes here.')),
            const SizedBox(height: 24),

            // Now Playing Section (Placeholder)
            const Text(
              'Now Playing',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Center(child: Text('Now Playing movies list goes here.')),
          ],
        ),
      ),
    );
  }
}
