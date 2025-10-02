import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Food Menu',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.primary, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    'Search for meals',
                    style: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Customize a meal card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customize a meal',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Stay fit but still taste good',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textPrimary.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(0.8),
                          AppColors.primary.withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.restaurant,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Filter buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterButton('Category', Icons.keyboard_arrow_down),
                const SizedBox(width: 12),
                _buildFilterButton('Dietary', Icons.keyboard_arrow_down),
                const SizedBox(width: 12),
                _buildFilterButton('Price', Icons.keyboard_arrow_down),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Predefined Bowls section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Predefined Bowls',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Bowl items
                  _buildBowlItem(
                    'Mediterranean Quinoa Bowl',
                    'Calories: 460 (Green) | Protein: 15g | Carbs: 40g | Fat: 25g',
                    Colors.green,
                  ),
                  const SizedBox(height: 16),

                  _buildBowlItem(
                    'Spicy Thai Peanut Bowl',
                    'Calories: 520 (Yellow) | Protein: 20g | Carbs: 50g | Fat: 28g',
                    Colors.orange,
                  ),
                  const SizedBox(height: 16),

                  _buildBowlItem(
                    'Southwest Chipotle Bowl',
                    'Calories: 580 (Red) | Protein: 25g | Carbs: 60g | Fat: 30g',
                    Colors.red,
                  ),
                  const SizedBox(height: 16),

                  _buildBowlItem(
                    'Asian Fusion Bowl',
                    'Calories: 420 (Green) | Protein: 18g | Carbs: 35g | Fat: 22g',
                    Colors.green,
                  ),
                  const SizedBox(height: 16),

                  _buildBowlItem(
                    'Italian Herb Bowl',
                    'Calories: 510 (Yellow) | Protein: 22g | Carbs: 45g | Fat: 26g',
                    Colors.orange,
                  ),
                  const SizedBox(height: 16),

                  _buildBowlItem(
                    'Mexican Fiesta Bowl',
                    'Calories: 590 (Red) | Protein: 28g | Carbs: 55g | Fat: 32g',
                    Colors.red,
                  ),
                  const SizedBox(height: 16),

                  _buildBowlItem(
                    'Greek Power Bowl',
                    'Calories: 450 (Green) | Protein: 20g | Carbs: 38g | Fat: 24g',
                    Colors.green,
                  ),
                  const SizedBox(height: 16),

                  _buildBowlItem(
                    'Teriyaki Salmon Bowl',
                    'Calories: 540 (Yellow) | Protein: 30g | Carbs: 42g | Fat: 28g',
                    Colors.orange,
                  ),
                  const SizedBox(
                    height: 100,
                  ), // Extra space for bottom navigation
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 'Home', false, () {
              GoRouter.of(context).go('/');
            }),
            _buildNavItem(Icons.apps, 'AI Order', false, () {
              GoRouter.of(context).go('/ai-recommendations');
            }),
            _buildNavItem(Icons.receipt_long, 'Menu', true, null),
            _buildNavItem(Icons.shopping_cart_outlined, 'Cart', false, () {
              GoRouter.of(context).go('/cart');
            }),
            _buildNavItem(Icons.person_outline, 'Profile', false, () {
              GoRouter.of(context).go('/profile');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textPrimary.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Icon(icon, size: 16, color: AppColors.textPrimary),
        ],
      ),
    );
  }

  Widget _buildBowlItem(String title, String details, Color calorieColor) {
    return GestureDetector(
      onTap: () {
        // Navigate to menu detail screen
        // GoRouter.of(context).go('/menu/detail/$itemId');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Food image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.8),
                    AppColors.primary.withOpacity(0.6),
                  ],
                ),
              ),
              child: const Icon(Icons.rice_bowl, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),

            // Bowl details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    details,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textPrimary.withOpacity(0.6),
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isSelected,
    VoidCallback? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected
                ? AppColors.primary
                : AppColors.textPrimary.withOpacity(0.5),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.textPrimary.withOpacity(0.5),
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
