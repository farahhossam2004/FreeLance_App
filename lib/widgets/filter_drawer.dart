import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  _FilterDrawerState createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  String? selectedCategory;
  String? selectedCountry;
  String? selectedExperienceLevel;
  String? minPrice;
  String? maxPrice;
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 45, 51),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildCategoryDropDown(),
            const SizedBox(height: 25),
            _buildCountryDropDown(),
            const SizedBox(height: 25),
            _buildExperienceLevel(),
            const SizedBox(height: 25),
            _buildPriceRange(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _resetFilters,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 198, 194, 194)),
                  child: const Text(
                    'Reset Filter',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: _applyFilters,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    'Apply Filter',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDropDown() {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 1),
        ),
      ),
      hint: const Text('Select Category'),
      items: const [
        DropdownMenuItem(
          value: '1',
          child: Text('Category 1'),
        ),
        DropdownMenuItem(
          value: '2',
          child: Text('Category 2'),
        ),
        DropdownMenuItem(
          value: 'none',
          child: Text('None'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          selectedCategory = value == 'none' ? null : value;
        });
      },
    );
  }

  Widget _buildCountryDropDown() {
    return DropdownButtonFormField<String>(
      value: selectedCountry,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.green, width: 1),
        ),
      ),
      hint: const Text('Select Country'),
      items: const [
        DropdownMenuItem(
          value: '1',
          child: Text('Egypt'),
        ),
        DropdownMenuItem(
          value: '2',
          child: Text('France'),
        ),
        DropdownMenuItem(
          value: '3',
          child: Text('Germany'),
        ),
        DropdownMenuItem(
          value: '4',
          child: Text('England'),
        ),
        DropdownMenuItem(
          value: 'none',
          child: Text('None'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          selectedCountry = value == 'none' ? null : value;
        });
      },
    );
  }

  Widget _buildExperienceLevel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Experience Level',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        RadioListTile(
          value: 'any',
          groupValue: selectedExperienceLevel,
          onChanged: (value) {
            setState(() {
              selectedExperienceLevel = value;
            });
          },
          title: const Text('Any'),
        ),
        RadioListTile(
          value: 'senior',
          groupValue: selectedExperienceLevel,
          onChanged: (value) {
            setState(() {
              selectedExperienceLevel = value;
            });
          },
          title: const Text('Senior Level'),
        ),
        RadioListTile(
          value: 'mid',
          groupValue: selectedExperienceLevel,
          onChanged: (value) {
            setState(() {
              selectedExperienceLevel = value;
            });
          },
          title: const Text('Mid Level'),
        ),
        RadioListTile(
          value: 'junior',
          groupValue: selectedExperienceLevel,
          onChanged: (value) {
            setState(() {
              selectedExperienceLevel = value;
            });
          },
          title: const Text('Junior Level'),
        ),
      ],
    );
  }

  Widget _buildPriceRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Job Price Budget',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: minController,
                decoration: InputDecoration(
                  hintText: 'Min',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.green, width: 1),
                  ),
                ),
                onChanged: (value) => minPrice = value,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: maxController,
                decoration: InputDecoration(
                  hintText: 'Max',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.green, width: 1),
                  ),
                ),
                onChanged: (value) => maxPrice = value,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _resetFilters() {
    setState(() {
      selectedCategory = null;
      selectedCountry = null;
      selectedExperienceLevel = 'any';
      minPrice = null;
      maxPrice = null;
      minController.clear(); // Clear min field
      maxController.clear();
    });
  }

  void _applyFilters() {
    // Apply filter logic
  }
}

