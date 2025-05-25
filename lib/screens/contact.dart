import 'package:colorful_iconify_flutter/icons/twemoji.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/widgets/sidebar.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'dart:html' as html;

import 'package:provider/provider.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider.value(
      value: ResumeProvider(),
      child: Consumer<ResumeProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Card(
                elevation: 0.0,
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(theme),
                      _buildSubheader(theme),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _buildContactCard(
                            context: context,
                            theme: theme,
                            applyLogoColor: false,
                            logoData: LogoData(Logos.whatsapp, ContactColors.whatsapp),
                            contactInfo: ContactInfo(
                              icon: Twemoji.flag_ecuador,
                              label: "+593 99 892 1541",
                            ),
                            title: "",
                            buttonColor: ContactColors.whatsapp,
                            onPressed: () => _launchURL('https://wa.me/593998921541'),
                            buttonIconColor: primaryColor,
                            buttonTextColor: primaryColor,
                            showTitle: false,
                          ),
                          _buildContactCard(
                            context: context,
                            theme: theme,
                            logoData: LogoData(Logos.linkedin, ContactColors.linkedin),
                            contactInfo: ContactInfo(
                              icon: Twemoji.link,
                              label: "Anthony Chamba",
                              iconSize: 18,
                            ),
                            onPressed: () => _launchURL('https://www.linkedin.com/in/anthony-chamba-73b50828b/'),
                            buttonColor: ContactColors.linkedin,
                            buttonTextColor: primaryColor,
                            buttonIconColor: primaryColor,
                            showTitle: false,
                          ),
                          _buildContactCard(
                            context: context,
                            theme: theme,
                            applyLogoColor: false,
                            logoData: LogoData(Logos.facebook, ContactColors.facebook),
                            contactInfo: ContactInfo(
                              icon: Twemoji.link,
                              label: "Anthony Chamba",
                              iconSize: 18,
                            ),
                            onPressed: () => _launchURL('https://facebook.com/anthony.chamba.9'),
                            buttonColor: ContactColors.facebook,
                            buttonTextColor: primaryColor,
                            buttonIconColor: primaryColor,
                            showTitle: true,
                            title: "Facebook",
                          ),
                          _buildContactCard(
                            context: context,
                            theme: theme,
                            logoData: LogoData(Logos.github, ContactColors.github, logoColor: ContactColors.github),
                            contactInfo: ContactInfo(
                              icon: Logos.github_icon,
                              label: "noobgrammer1",
                              iconSize: 18,
                              iconColor: ContactColors.github,
                              textColor: ContactColors.github,
                            ),
                            onPressed: () => _launchURL('https://github.com/noobgrammer1'),
                            buttonColor: ContactColors.github,
                            buttonTextColor: primaryColor,
                            buttonIconColor: primaryColor,
                            showTitle: false,
                          ),
                          _buildGmailCard(theme),
                          _buildActionCard(
                            theme: theme,
                            title: "Download PDF",
                            description: "Get a copy of my resume",
                            icon: LucideIcons.fileDown,
                            buttonLabel: "Download",
                            buttonIcon: LucideIcons.download,
                            buttonColor: Colors.greenAccent,
                            onPressed: () => _downloadPdf(provider.currentPdfUrl),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) => Text(
        "Contact",
        style: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  Widget _buildSubheader(ThemeData theme) => Text(
        "Get in touch with me through these channels",
        style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
      );

  Widget _buildContactCard({
    required BuildContext context,
    required ThemeData theme,
    required LogoData logoData,
    required ContactInfo contactInfo,
    required Color buttonColor,
    bool applyLogoColor = true,
    Color buttonTextColor = Colors.black87,
    Color buttonIconColor = Colors.white,
    required VoidCallback onPressed,
    bool showTitle = false,
    String title = "",
  }) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle)
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: buttonColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Iconify(logoData.logo, color: applyLogoColor ? logoData.logoColor : null),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          else
            Container(
              decoration: BoxDecoration(
                color: buttonColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Iconify(logoData.logo, color: applyLogoColor ? logoData.logoColor : null),
            ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              //copiar al clipboard el valor de label
              Clipboard.setData(ClipboardData(text: contactInfo.label));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${contactInfo.label} Copiado al portapapeles"),
                  backgroundColor: primaryColor,
                  duration: const Duration(seconds: 2),
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                  behavior: SnackBarBehavior.floating,
                  width: 300,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Iconify(
                  contactInfo.icon,
                  size: contactInfo.iconSize,
                  color: applyLogoColor ? contactInfo.iconColor : null,
                ),
                const SizedBox(width: 8),
                Text(
                  contactInfo.label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: contactInfo.textColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              icon: Icon(LucideIcons.externalLink, color: buttonTextColor, size: 18),
              label: Text(
                "Open",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: buttonTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGmailCard(ThemeData theme) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.2), // Usando rojo de Gmail como color principal
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Iconify(Logos.google_gmail),
              ),
              const SizedBox(width: 12),
              Text(
                "Gmail",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.mail,
                size: 18,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                "elbolonxd@gmail.com",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => _launchURL(
                'https://mail.google.com/mail/u/0/#inbox?compose=CllgCJqXxrcKKZqPKlJPJNjjBjTLhNkXGwRvDhjcxDStbgdNwmxKqgsRXFRtKnpVtBpGXXtzqsB',
              ),
              style: TextButton.styleFrom(
                backgroundColor: ContactColors.github,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              icon: Icon(LucideIcons.externalLink, color: primaryColor, size: 18),
              label: Text(
                "Abrir",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required ThemeData theme,
    required String title,
    required String description,
    required IconData icon,
    required String buttonLabel,
    required IconData buttonIcon,
    required Color buttonColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: buttonColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(icon, color: buttonColor),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              icon: Icon(buttonIcon, color: Colors.black87, size: 18),
              label: Text(
                buttonLabel,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _downloadPdf(String pdfPath) {
    if (kIsWeb) {
      // For web, create an anchor element to download the PDF
      html.AnchorElement anchorElement = html.AnchorElement(href: pdfPath);
      anchorElement.download = 'Anthony_Resume.pdf';
      anchorElement.click();
    }
  }

  // Helper method to launch URL in a new tab
  void _launchURL(String url) => html.window.open(url, '_blank');
}

class LogoData {
  final String logo;
  final Color borderColor;
  final Color logoColor;

  LogoData(this.logo, this.borderColor, {this.logoColor = Colors.white});
}

class ContactInfo {
  final String icon;
  final String label;
  final double iconSize;
  final Color iconColor;
  final Color textColor;

  ContactInfo({
    required this.icon,
    required this.label,
    this.iconSize = 24,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  });
}

class ContactColors {
  static const whatsapp = Color(0xFF25D366);
  static const linkedin = Color(0xFF0A66C2);
  static const facebook = Color(0xFF1877F2);
  static const github = Color(0xFFFFFFFF);
  static const List<Color> gmail = [Colors.yellow, Colors.red, Colors.blue, Colors.green];
}

// Provider for managing resume state
class ResumeProvider extends ChangeNotifier {
  final String _currentPdfUrl = 'assets/resume.pdf';
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  String get currentPdfUrl => _currentPdfUrl;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

  // Check if the PDF asset exists
  Future<void> checkPdfExists() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Try to load the PDF data
      await rootBundle.load(_currentPdfUrl);

      _isLoading = false;
      _hasError = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _hasError = true;
      _errorMessage = 'Error loading PDF: $e';
      notifyListeners();
      print('PDF Error: $e');
    }
  }
}
