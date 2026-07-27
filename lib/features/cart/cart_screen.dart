/*import 'package:flutter/material.dart';
import 'package:rania_store/core/models/product_new.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/checkout/checkout_screen.dart';

class CarttScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Product> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = [
      Product(
        id: '1',
        name: 'هودي بنفسجي',
        price: 49.99,
        imageAsset: 'hoodie',
        quantity: 1,
      ).copyWith(),
      Product(
        id: '2',
        name: 'حذاء رياضي',
        price: 59.99,
        imageAsset: 'shoes',
        quantity: 1,
      ),
      Product(
        id: '3',
        name: 'ساعة يد أنيقة',
        price: 89.99,
        imageAsset: 'watch',
        quantity: 1,
      ),
    ];
  }

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
  double get shipping => cartItems.isEmpty ? 0 : 10.0;
  double get total => subtotal + shipping;

  void _updateQuantity(int index, int delta) {
    setState(() {
      final newQty = cartItems[index].quantity + delta;
      if (newQty <= 0) {
        cartItems.removeAt(index);
      } else {
        cartItems[index] = cartItems[index].copyWith(quantity: newQty);
      }
    });
  }

  IconData _iconFor(String key) {
    switch (key) {
      case 'watch':
        return Icons.watch_outlined;
      case 'hoodie':
        return Icons.checkroom_outlined;
      case 'shoes':
        return Icons.stairs_outlined;
      default:
        return Icons.image_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'سلة المشتريات',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: cartItems.isEmpty
                    ? const Center(
                        child: Text(
                          'السلة فارغة',
                          style: TextStyle(color: AppColors.textGray),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.fieldFill,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.fieldBorder),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () =>
                                      setState(() => cartItems.removeAt(index)),
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _stepperButton(
                                          Icons.add,
                                          () => _updateQuantity(index, 1),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          '${item.quantity}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        _stepperButton(
                                          Icons.remove,
                                          () => _updateQuantity(index, -1),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '\$${item.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  height: 64,
                                  width: 64,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    _iconFor(item.imageAsset),
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.fieldBorder)),
                ),
                child: Column(
                  children: [
                    _summaryRow('الإجمالي الفرعي', subtotal),
                    const SizedBox(height: 6),
                    _summaryRow('الشحن', shipping),
                    const Divider(height: 24, color: AppColors.fieldBorder),
                    _summaryRow('الإجمالي الكلي', total, bold: true),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: cartItems.isEmpty
                            ? null
                            : () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => CheckoutScreen(
                                      subtotal: subtotal,
                                      shipping: shipping,
                                    ),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'إتمام الطلب',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepperButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.fieldBorder),
        ),
        child: Icon(icon, size: 16, color: AppColors.primary),
      ),
    );
  }

  Widget _summaryRow(String label, double value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: bold ? AppColors.textDark : AppColors.textGray,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(
            color: bold ? AppColors.primary : AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: bold ? 18 : 14,
          ),
        ),
      ],
    );
  }
}
*/
