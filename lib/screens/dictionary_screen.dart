import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  bool _isGridView = true;

  final List<String> _categories = [
    'All',
    'Alphabets',
    'Numbers',
    'Greetings',
    'Family',
    'Emotions',
    'Emergency',
  ];

  final List<Map<String, dynamic>> _dictionaryItems = [
    {
      'word': 'A',
      'category': 'Alphabets',
      'desc': 'Fist closed, thumb pointing up along the side of the index finger.',
      'icon': Icons.abc_rounded,
    },
    {
      'word': 'B',
      'category': 'Alphabets',
      'desc': 'Open palm, fingers together, thumb folded across the palm.',
      'icon': Icons.abc_rounded,
    },
    {
      'word': 'C',
      'category': 'Alphabets',
      'desc': 'Fingers and thumb curved to form a C shape outline.',
      'icon': Icons.abc_rounded,
    },
    {
      'word': 'One (1)',
      'category': 'Numbers',
      'desc': 'Index finger pointed straight up, other fingers curled into palm.',
      'icon': Icons.pin_rounded,
    },
    {
      'word': 'Two (2)',
      'category': 'Numbers',
      'desc': 'Index and middle fingers pointed up, other fingers curled.',
      'icon': Icons.pin_rounded,
    },
    {
      'word': 'Hello',
      'category': 'Greetings',
      'desc': 'Wave hand flatly outwards from the side of the forehead.',
      'icon': Icons.waving_hand_rounded,
    },
    {
      'word': 'Thank You',
      'category': 'Greetings',
      'desc': 'Touch fingertips to lips, then move hand flatly down and out.',
      'icon': Icons.clean_hands_rounded,
    },
    {
      'word': 'Mother',
      'category': 'Family',
      'desc': 'Tap the side of your chin twice with your index finger.',
      'icon': Icons.female_rounded,
    },
    {
      'word': 'Father',
      'category': 'Family',
      'desc': 'Tap the side of your forehead twice with your index finger.',
      'icon': Icons.male_rounded,
    },
    {
      'word': 'Happy',
      'category': 'Emotions',
      'desc': 'Sweep open palms in circular motion across chest without touching.',
      'icon': Icons.emoji_emotions_rounded,
    },
    {
      'word': 'Help',
      'category': 'Emergency',
      'desc': 'Place a closed fist (thumb up) on top of an open flat palm.',
      'icon': Icons.medical_services_rounded,
    },
    {
      'word': 'Danger',
      'category': 'Emergency',
      'desc': 'Cross wrists in front of chest, hands curled, pulsing rapidly.',
      'icon': Icons.warning_rounded,
    },
  ];

  List<Map<String, dynamic>> get _filteredItems {
    return _dictionaryItems.where((item) {
      final matchesQuery = item['word'].toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'All' || item['category'] == _selectedCategory;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  void _showDetailsDialog(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.secondaryBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: AppColors.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryAccent.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item['category'].toUpperCase(),
                        style: GoogleFonts.inter(
                          color: AppColors.secondaryAccent,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded, color: AppColors.secondaryText),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cardBg,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Icon(item['icon'], size: 56, color: AppColors.primaryAccent),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  item['word'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sora(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'HOW TO SIGN:',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryText,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item['desc'],
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.primaryText.withOpacity(0.9),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                  ),
                  child: Text(
                    'Practice Gesture',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBg,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Column(
          children: [
            // Top dictionary search header
            _buildSearchHeader(),
            
            // Category filter chips
            _buildCategoryFilters(),
            
            // Dictionary content layout
            Expanded(
              child: _filteredItems.isEmpty
                  ? _buildEmptyState()
                  : (_isGridView ? _buildGridView() : _buildListView()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ISL Dictionary',
                style: GoogleFonts.sora(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              IconButton(
                icon: Icon(
                  _isGridView ? Icons.view_list_rounded : Icons.grid_view_rounded,
                  color: AppColors.primaryAccent,
                ),
                onPressed: () {
                  setState(() {
                    _isGridView = !_isGridView;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search box
          TextField(
            onChanged: (val) {
              setState(() {
                _searchQuery = val;
              });
            },
            style: GoogleFonts.inter(color: AppColors.primaryText),
            decoration: InputDecoration(
              hintText: 'Search sign language words...',
              hintStyle: GoogleFonts.inter(color: AppColors.secondaryText.withOpacity(0.6), fontSize: 14),
              prefixIcon: const Icon(Icons.search_rounded, color: AppColors.secondaryText),
              filled: true,
              fillColor: AppColors.secondaryBg,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.border, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.primaryAccent, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          final isSelected = _selectedCategory == cat;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(
                cat,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primaryBg : AppColors.primaryText,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = cat;
                });
              },
              selectedColor: AppColors.primaryAccent,
              backgroundColor: AppColors.secondaryBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isSelected ? AppColors.primaryAccent : AppColors.border,
                ),
              ),
              showCheckmark: false,
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridView() {
    final items = _filteredItems;
    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => _showDetailsDialog(item),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondaryBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cardBg,
                  ),
                  child: Icon(item['icon'], color: AppColors.primaryAccent, size: 24),
                ),
                const SizedBox(height: 12),
                Text(
                  item['word'],
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['category'],
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    final items = _filteredItems;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => _showDetailsDialog(item),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.secondaryBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cardBg,
                  ),
                  alignment: Alignment.center,
                  child: Icon(item['icon'], color: AppColors.primaryAccent, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['word'],
                        style: GoogleFonts.sora(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['desc'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.border, size: 14),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off_rounded, size: 64, color: AppColors.border),
          const SizedBox(height: 16),
          Text(
            'No signs match your filters',
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Try adjusting your search query or category.',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
