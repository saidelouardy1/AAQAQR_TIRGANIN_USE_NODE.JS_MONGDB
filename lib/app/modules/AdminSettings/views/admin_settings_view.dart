import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/admin_settings_controller.dart';

class AdminSettingsView extends GetView<AdminSettingsController> {
  const AdminSettingsView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة معلومات المتجر
            _buildStoreInfoCard(),
            SizedBox(height: 20),
            
            // إعدادات عامة
            _buildSectionTitle('الإعدادات العامة'),
            _buildGeneralSettings(),
            SizedBox(height: 20),
            
            // إعدادات الفواتير
            _buildSectionTitle('إعدادات الفواتير'),
            _buildInvoiceSettings(),
            SizedBox(height: 20),
            
            // إعدادات الأمان
            _buildSectionTitle('الأمان والخصوصية'),
            _buildSecuritySettings(),
            SizedBox(height: 20),
            
            // إجراءات متقدمة
            _buildSectionTitle('الإجراءات المتقدمة'),
            _buildAdvancedActions(),
            SizedBox(height: 30),
            
            // معلومات التطبيق
            _buildAppInfo(),
          ],
        ),
      ),
    );
  }
  
  // بطاقة معلومات المتجر
  Widget _buildStoreInfoCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue[100],
              child: Icon(
                Icons.store,
                size: 40,
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'متجر مواد البناء',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'إدارة متكاملة للمنتجات والفواتير',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem('الفئات', '5'),
                _buildInfoItem('المنتجات', '47'),
                _buildInfoItem('الفواتير', '23'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInfoItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
  
  // الإعدادات العامة
  Widget _buildGeneralSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildSettingItem(
            icon: Icons.language,
            title: 'اللغة',
            subtitle: 'العربية',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showLanguageDialog(),
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.currency_exchange,
            title: 'العملة',
            subtitle: 'دينار جزائري (د.ج)',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showCurrencyDialog(),
          ),
          _buildDivider(),
         
        ],
      ),
    );
  }
  
  // إعدادات الفواتير
  Widget _buildInvoiceSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildSettingItem(
            icon: Icons.format_shapes,
            title: 'تنسيق الفواتير',
            subtitle: 'النموذج الأساسي',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showInvoiceFormatDialog(),
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.confirmation_number,
            title: 'تسلسل أرقام الفواتير',
            subtitle: 'F-2024-001',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showInvoiceSequenceDialog(),
          ),
        ],
      ),
    );
  }
  
  // إعدادات الأمان
  Widget _buildSecuritySettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildSettingItem(
            icon: Icons.lock,
            title: 'تغيير كلمة المرور',
            subtitle: 'آخر تحديث منذ شهر',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _showChangePasswordDialog(),
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.history,
            title: 'سجل النشاط',
            subtitle: 'عرض سجل الدخول',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => controller.viewActivityLog(),
          ),
        ],
      ),
    );
  }
  
  // الإجراءات المتقدمة
  Widget _buildAdvancedActions() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildSettingItem(
            icon: Icons.backup,
            title: 'إنشاء نسخة احتياطية',
            subtitle: 'البيانات والإعدادات',
            trailing: Icon(Icons.cloud_upload, color: Colors.blue),
            onTap: () => controller.createBackup(),
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.download,
            title: 'استعادة النسخة الاحتياطية',
            subtitle: 'استرجاع البيانات',
            trailing: Icon(Icons.cloud_download, color: Colors.green),
            onTap: () => controller.restoreBackup(),
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.delete_sweep,
            title: 'مسح البيانات',
            subtitle: 'حذف جميع البيانات',
            trailing: Icon(Icons.warning, color: Colors.orange),
            onTap: () => _showClearDataDialog(),
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.exit_to_app,
            title: 'تسجيل الخروج',
            subtitle: 'الخروج من الحساب',
            trailing: Icon(Icons.logout, color: Colors.red),
            onTap: () => controller.logout(),
          ),
        ],
      ),
    );
  }
  
  // معلومات التطبيق
  Widget _buildAppInfo() {
    return Center(
      child: Column(
        children: [
          Text(
            'إصدار التطبيق 1.0.0',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            '© 2024 متجر مواد البناء. جميع الحقوق محفوظة',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
  
  // عنصر إعداد فردي
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.blue[700], size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
  
  // فاصل بين العناصر
  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(height: 1),
    );
  }
  
  // عنوان القسم
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12, right: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }
  
  // ديالوج اختيار اللغة
  void _showLanguageDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('اختر اللغة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text('العربية'),
              trailing: Icon(Icons.check, color: Colors.blue),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('English'),
              trailing: null,
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Français'),
              trailing: null,
              onTap: () => Get.back(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('إلغاء'),
          ),
        ],
      ),
    );
  }
  
  // ديالوج اختيار العملة
  void _showCurrencyDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('اختر العملة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Text('د.ج', style: TextStyle(fontWeight: FontWeight.bold)),
              title: Text('دينار جزائري'),
              trailing: Icon(Icons.check, color: Colors.blue),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: Text('\$', style: TextStyle(fontWeight: FontWeight.bold)),
              title: Text('دولار أمريكي'),
              trailing: null,
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: Text('€', style: TextStyle(fontWeight: FontWeight.bold)),
              title: Text('يورو'),
              trailing: null,
              onTap: () => Get.back(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('إلغاء'),
          ),
        ],
      ),
    );
  }
  
  // ديالوجات أخرى (يمكن تنفيذها بشكل مشابه)
  void _showInvoiceFormatDialog() {
    // تنفيذ اختيار تنسيق الفواتير
  }
  
  void _showInvoiceSequenceDialog() {
    // تنفيذ إعداد تسلسل الفواتير
  }
  
  void _showChangePasswordDialog() {
    // تنفيذ تغيير كلمة المرور
  }
  
  void _showClearDataDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('تأكيد مسح البيانات'),
        content: Text('هل أنت متأكد من أنك تريد حذف جميع البيانات؟ لا يمكن التراجع عن هذا الإجراء.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              controller.clearAllData();
            },
            child: Text('مسح الكل', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}