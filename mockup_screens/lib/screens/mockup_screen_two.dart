// My mockupscreen two as movie screen

import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int _selectedTabIndex = 0;
  final List<String> _categories = [
    'Popular',
    'Upcoming',
    'Now Playing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A3B78),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: _buildMovieList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF0487D9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'TMDB',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white38),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.white54, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Find your movies...',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Sort | Filters',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Text(
        'Discover & Enjoy\nYour Favourite Movies',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        children: List.generate(_categories.length, (index) {
          bool isSelected = index == _selectedTabIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF0487D9) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMovieList() {
    if (_selectedTabIndex == 0) {
      return Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            _buildMovieItem(
              'To All the Boys: P.S. I Still Love You',
              '2019 • 1h 48m',
              'Romance, Comedy',
              'Lara Jean and Peter have just taken their romance from a lo...',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQm5-nwFCXhoVCwtui_vXyCrc2AWDVgtjvTg&s',
              '7.2',
            ),
            _buildMovieItem(
              'Baby Driver',
              '2019 • 1h 53m',
              'Car Action, Crime, Drama',
              'After being coerced into working for a crime boss, a yo...',
              'https://m.media-amazon.com/images/M/MV5BMjM3MjQ1MzkxNl5BMl5BanBnXkFtZTgwODk1ODgyMjI@._V1_.jpg',
              '7.2',
            ),
            _buildMovieItem(
              'John Wick',
              '2019 • 2h 10m',
              'Action, Crime, Thriller',
              'John Wick is on the run after killing a member of the intern...',
              'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_.jpg',
              '7.2',
            ),
            _buildMovieItem(
              'Exit',
              '2019 • 2h 10m',
              'Action, Comedy',
              'Yong-nam (Jo Jung-suk) was once...',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQm5-nwFCXhoVCwtui_vXyCrc2AWDVgtjvTg&s',
              '7.2',
            ),
          ],
        ),
      );
    } else {
      // Placeholder for other tabs that are unclickable
      return Center(
        child: Text(
          'No movies available in ${_categories[_selectedTabIndex]}',
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
  }

  Widget _buildMovieItem(String title, String duration, String genres,
      String description, String imageUrl, String rating) {
    return Container(
      height: 160,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie poster
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 110,
              color: Colors.grey[800],
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0ACFCE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        rating,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Movie details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: Colors.black54,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  genres,
                  style: TextStyle(
                    color: Colors.grey[800], // Darker gray for better contrast
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[700], // Darker gray for better contrast
                    fontSize: 13,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
