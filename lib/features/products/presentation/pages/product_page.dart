import 'package:flutpos/core/theme/app_colors.dart';
import 'package:flutpos/features/products/domain/entities/product_entity.dart';
import 'package:flutpos/features/products/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductState state = ref.watch(productControllerProvider);
    final ProductController controller = ref.read(
      productControllerProvider.notifier,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Local Product CRUD'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: state.isLoading ? null : controller.loadProducts,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openProductForm(),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Produk'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.loadProducts,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
            children: [
              _buildHero(state),
              const SizedBox(height: 16),
              _buildStats(state),
              const SizedBox(height: 20),
              TextField(
                onChanged: controller.updateSearchQuery,
                controller: _searchController..text = state.searchQuery,
                decoration: InputDecoration(
                  hintText: 'Cari nama, kategori, atau deskripsi',
                  prefixIcon: const Icon(Icons.search_rounded),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (state.errorMessage != null) ...[
                _ErrorBanner(message: state.errorMessage!),
                const SizedBox(height: 16),
              ],
              if (state.isLoading && state.totalProducts == 0)
                const Padding(
                  padding: EdgeInsets.only(top: 48),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (state.filteredProducts.isEmpty)
                _EmptyState(onAddPressed: _openProductForm)
              else
                ...state.filteredProducts.map(
                  (Product product) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ProductCard(
                      product: product,
                      onEdit: () => _openProductForm(product: product),
                      onDelete: () =>
                          _deleteProduct(context, controller, product),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(ProductState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.tertiary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kelola produk secara lokal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Dummy data tersimpan di memory aplikasi. Tambah, ubah, dan hapus produk langsung dari layar ini.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _HeroMetric(
                label: 'Produk',
                value: state.totalProducts.toString(),
              ),
              const SizedBox(width: 12),
              _HeroMetric(
                label: 'Stok Rendah',
                value: state.lowStockProducts.toString(),
              ),
              const SizedBox(width: 12),
              _HeroMetric(
                label: 'Stok Habis',
                value: state.outOfStockProducts.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStats(ProductState state) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            label: 'Total Inventori',
            value: state.totalProducts.toString(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            label: 'Nilai Stok',
            value: _formatCurrency(state.inventoryValue),
          ),
        ),
      ],
    );
  }

  Future<void> _openProductForm({Product? product}) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return _ProductFormSheet(
          product: product,
          onSubmit: (Product payload) async {
            final ProductController controller = ref.read(
              productControllerProvider.notifier,
            );
            await controller.saveProduct(payload);
            if (mounted) {
              ScaffoldMessenger.of(this.context).showSnackBar(
                SnackBar(
                  content: Text(
                    product == null
                        ? 'Produk berhasil ditambahkan'
                        : 'Produk berhasil diperbarui',
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Future<void> _deleteProduct(
    BuildContext context,
    ProductController controller,
    Product product,
  ) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus produk?'),
          content: Text(
            'Produk ${product.name} akan dihapus dari data dummy lokal.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await controller.deleteProduct(product.id);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${product.name} dihapus')));
      }
    }
  }

  String _formatCurrency(double value) {
    final String digits = value
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]}.',
        );
    return 'Rp $digits';
  }
}

class _HeroMetric extends StatelessWidget {
  const _HeroMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  final Product product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final Color statusColor = product.isOutOfStock
        ? Colors.red
        : product.isLowStock
        ? Colors.orange
        : Colors.green;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: statusColor.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: 76,
                  height: 76,
                  color: AppColors.surface,
                  child: product.imageUrl == null
                      ? const Icon(
                          Icons.inventory_2_outlined,
                          color: AppColors.primary,
                        )
                      : Image.network(
                          product.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const Icon(
                            Icons.inventory_2_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        _StatusChip(
                          label: product.isOutOfStock
                              ? 'Habis'
                              : product.isLowStock
                              ? 'Tipis'
                              : 'Aman',
                          color: statusColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.description ?? 'Tidak ada deskripsi.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _InfoPill(
                          icon: Icons.sell_outlined,
                          label: _formatCurrency(product.price),
                        ),
                        _InfoPill(
                          icon: Icons.inventory_2_outlined,
                          label: '${product.stock} ${product.unit.label}',
                        ),
                        _InfoPill(
                          icon: Icons.category_outlined,
                          label: product.category?.name ?? product.categoryId,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                'Updated ${_relativeTime(product.updatedAt)}',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined),
                label: const Text('Edit'),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                label: const Text('Hapus'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _formatCurrency(double value) {
    final String digits = value
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]}.',
        );
    return 'Rp $digits';
  }

  String _relativeTime(DateTime value) {
    final Duration diff = DateTime.now().difference(value);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    }
    return '${diff.inDays}d ago';
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F5F8),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey.shade700),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onAddPressed});

  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              'Belum ada produk.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Tambahkan produk dummy pertama untuk mengisi daftar.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: onAddPressed,
              icon: const Icon(Icons.add),
              label: const Text('Tambah Produk'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red),
          const SizedBox(width: 12),
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _ProductFormSheet extends StatefulWidget {
  const _ProductFormSheet({required this.onSubmit, this.product});

  final Future<void> Function(Product product) onSubmit;
  final Product? product;

  @override
  State<_ProductFormSheet> createState() => _ProductFormSheetState();
}

class _ProductFormSheetState extends State<_ProductFormSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _costPriceController;
  late final TextEditingController _stockController;
  late final TextEditingController _minStockController;
  late final TextEditingController _barcodeController;
  late final TextEditingController _imageUrlController;
  late final TextEditingController _categoryIdController;
  late ProductUnit _unit;
  late bool _isActive;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    final Product? product = widget.product;
    _nameController = TextEditingController(text: product?.name ?? '');
    _descriptionController = TextEditingController(
      text: product?.description ?? '',
    );
    _priceController = TextEditingController(
      text: product == null ? '' : product.price.toStringAsFixed(0),
    );
    _costPriceController = TextEditingController(
      text: product?.costPrice?.toStringAsFixed(0) ?? '',
    );
    _stockController = TextEditingController(
      text: product?.stock.toString() ?? '0',
    );
    _minStockController = TextEditingController(
      text: product?.minStock.toString() ?? '5',
    );
    _barcodeController = TextEditingController(text: product?.barcode ?? '');
    _imageUrlController = TextEditingController(text: product?.imageUrl ?? '');
    _categoryIdController = TextEditingController(
      text: product?.categoryId ?? 'beverage',
    );
    _unit = product?.unit ?? ProductUnit.pcs;
    _isActive = product?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _costPriceController.dispose();
    _stockController.dispose();
    _minStockController.dispose();
    _barcodeController.dispose();
    _imageUrlController.dispose();
    _categoryIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets viewInsets = MediaQuery.of(context).viewInsets;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 160),
      padding: EdgeInsets.only(bottom: viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 44,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.product == null ? 'Tambah produk' : 'Edit produk',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Semua perubahan disimpan ke datasource lokal dummy.',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 20),
                  _buildField(
                    controller: _nameController,
                    label: 'Nama produk',
                    validator: _requiredValidator,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _descriptionController,
                    label: 'Deskripsi',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildField(
                          controller: _priceController,
                          label: 'Harga jual',
                          keyboardType: TextInputType.number,
                          validator: _numberValidator,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildField(
                          controller: _costPriceController,
                          label: 'Harga modal',
                          keyboardType: TextInputType.number,
                          validator: _optionalNumberValidator,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildField(
                          controller: _stockController,
                          label: 'Stok',
                          keyboardType: TextInputType.number,
                          validator: _integerValidator,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildField(
                          controller: _minStockController,
                          label: 'Minimal stok',
                          keyboardType: TextInputType.number,
                          validator: _integerValidator,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildField(controller: _barcodeController, label: 'Barcode'),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _imageUrlController,
                    label: 'Image URL',
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _categoryIdController,
                    label: 'Category ID',
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<ProductUnit>(
                    initialValue: _unit,
                    decoration: _inputDecoration('Satuan'),
                    items: ProductUnit.values
                        .map(
                          (ProductUnit unit) => DropdownMenuItem<ProductUnit>(
                            value: unit,
                            child: Text(unit.label),
                          ),
                        )
                        .toList(growable: false),
                    onChanged: (ProductUnit? value) {
                      if (value != null) {
                        setState(() => _unit = value);
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Produk aktif'),
                    value: _isActive,
                    onChanged: (bool value) =>
                        setState(() => _isActive = value),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _isSubmitting ? null : _submit,
                      child: _isSubmitting
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              widget.product == null
                                  ? 'Simpan Produk'
                                  : 'Perbarui Produk',
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: _inputDecoration(label),
      validator: validator,
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field ini wajib diisi';
    }
    return null;
  }

  String? _numberValidator(String? value) {
    final String? requiredError = _requiredValidator(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (double.tryParse(value!.replaceAll(',', '.')) == null) {
      return 'Harus angka';
    }
    return null;
  }

  String? _optionalNumberValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    if (double.tryParse(value.replaceAll(',', '.')) == null) {
      return 'Harus angka';
    }
    return null;
  }

  String? _integerValidator(String? value) {
    final String? requiredError = _requiredValidator(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (int.tryParse(value!.trim()) == null) {
      return 'Harus bilangan bulat';
    }
    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);

    final Product existing = widget.product ?? _buildNewProductSkeleton();
    final Product product = Product(
      id: existing.id,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      imageUrl: _imageUrlController.text.trim().isEmpty
          ? null
          : _imageUrlController.text.trim(),
      barcode: _barcodeController.text.trim().isEmpty
          ? null
          : _barcodeController.text.trim(),
      price: double.parse(_priceController.text.replaceAll(',', '.')),
      costPrice: _costPriceController.text.trim().isEmpty
          ? null
          : double.parse(_costPriceController.text.replaceAll(',', '.')),
      stock: int.parse(_stockController.text.trim()),
      minStock: int.parse(_minStockController.text.trim()),
      categoryId: _categoryIdController.text.trim(),
      category: existing.category,
      unit: _unit,
      isActive: _isActive,
      createdAt: existing.createdAt,
      updatedAt: DateTime.now(),
    );

    try {
      await widget.onSubmit(product);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Product _buildNewProductSkeleton() {
    return Product(
      id: 'prd-${DateTime.now().microsecondsSinceEpoch}',
      name: '',
      description: null,
      imageUrl: null,
      barcode: null,
      price: 0,
      costPrice: null,
      stock: 0,
      minStock: 5,
      categoryId: 'beverage',
      category: null,
      unit: ProductUnit.pcs,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
