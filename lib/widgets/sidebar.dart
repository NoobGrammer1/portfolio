import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/providers/portfolio_provider.dart';
import 'package:flutter_portfolio/screens/contact.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

const Color primaryColor = Color(0xFF0D1117);
const Color secondaryColor = Color(0xFF002A5C);
const Color accentColor = Color(0xFFEE2D24); //Deep red

class SidebarNavigation extends StatelessWidget {
  const SidebarNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      width: 280,
      color: primaryColor,
      child: Column(
        children: [
          const SizedBox(height: 40),

          // Profile image
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 2),
              image: const DecorationImage(
                image: AssetImage('assets/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Name
          const Text(
            'Anthony Chamba',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Mobile Software Engineer',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 11,
              fontWeight: FontWeight.normal,
            ),
          ),

          const SizedBox(height: 24),

          // Social Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Logos.google_gmail, () {
                _copyToClipboard(context, 'elbolonxd@gmail.com', 'Email address ${'elbolonxd@gmail.com'} copied to clipboard!');
                _launchURL(
                  'https://mail.google.com/mail/u/0/#inbox?compose=CllgCJqXxrcKKZqPKlJPJNjjBjTLhNkXGwRvDhjcxDStbgdNwmxKqgsRXFRtKnpVtBpGXXtzqsB',
                );
              }, tooltip: "Gmail", hoverColor: ContactColors.gmail.first),
              _buildSocialIcon(Logos.facebook, () => _launchURL('https://facebook.com/anthony.chamba.9'),
                  tooltip: "Facebook", hoverColor: ContactColors.facebook),
              _buildSocialIcon(Logos.whatsapp_icon, () {
                _copyToClipboard(context, '+593 99 892 1541', 'WhatsApp number ${'+593 99 892 1541'} copied to clipboard!');
                _launchURL('https://wa.me/593998921541');
              }, tooltip: "WhatsApp", hoverColor: ContactColors.whatsapp),
              _buildSocialIcon(Logos.github_icon, () => _launchURL('https://github.com/noobgrammer1'),
                  tooltip: "GitHub", hoverColor: ContactColors.github, iconColor: ContactColors.github),
            ],
          ),

          const SizedBox(height: 40),

          // Navigation items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildNavItem(context, 'home', 'Home', LucideIcons.house, isMobile),
                _buildNavItem(context, 'experience', 'Experience', LucideIcons.briefcase, isMobile),
                _buildNavItem(context, 'skills', 'Skills', LucideIcons.wrench, isMobile),
                _buildNavItem(context, 'about', 'About', LucideIcons.user, isMobile),
                // _buildNavItem(context, 'resume', 'Resume', LucideIcons.fileText),
                _buildNavItem(context, 'contact', 'Contact', LucideIcons.mail, isMobile),
              ],
            ),
          ),
          // Footer text
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              '© ${DateTime.now().year} Developed by Anthony Chamba with Flutter ',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String icon, VoidCallback onTap,
      {String tooltip = "Social Link", Color hoverColor = Colors.blue, Color? iconColor}) {
    return StatefulBuilder(builder: (context, setState) {
      bool isHovering = false;

      return MouseRegion(
        onEnter: (_) => setState(() => isHovering = true),
        onExit: (_) => setState(() => isHovering = false),
        child: Tooltip(
          message: tooltip,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: hoverColor.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          preferBelow: true,
          verticalOffset: 20,
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 200),
            tween: Tween<double>(begin: 1.0, end: isHovering ? 1.2 : 1.0),
            curve: Curves.easeOut,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isHovering ? hoverColor.withOpacity(0.8) : Colors.grey.withOpacity(0.1),
                    shape: BoxShape.circle,
                    boxShadow: isHovering
                        ? [
                            BoxShadow(
                              color: hoverColor.withOpacity(0.4),
                              blurRadius: 12,
                              spreadRadius: 2,
                            )
                          ]
                        : null,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(36),
                      onTap: onTap,
                      hoverColor: Colors.transparent,
                      splashColor: hoverColor.withOpacity(0.3),
                      child: Padding(
                        padding: EdgeInsets.all(isHovering ? 10.0 : 8.0),
                        child: Iconify(
                          icon,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }

  // Helper method to copy text to clipboard and show a snackbar
  void _copyToClipboard(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        width: 300,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // Helper method to launch URL in a new tab
  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  Widget _buildNavItem(BuildContext context, String section, String label, IconData icon, bool isMobile) {
    final provider = context.watch<PortfolioProvider>();
    final isActive = provider.activeSection == section;

    return _AnimatedNavItem(
      label: label,
      icon: icon,
      isActive: isActive,
      onTap: () {
        provider.setActiveSection(section);
        if (isMobile) {
          Navigator.maybePop(context);
        }
      },
    );
  }
}

// Animated StatefulWidget for hoverable navigation items
class _AnimatedNavItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _AnimatedNavItem({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  _AnimatedNavItemState createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<_AnimatedNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool showActiveStyle = widget.isActive || _isHovered;
    final Color itemColor = showActiveStyle ? Colors.white : Colors.grey;
    final FontWeight fontWeight = showActiveStyle ? FontWeight.w500 : FontWeight.normal;

    // Background color with animation
    final Color backgroundColor = widget.isActive ? accentColor.withValues(alpha: 0.75) : Colors.transparent;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200), // Animation duration
            curve: Curves.easeInOut, // Animation curve
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            // Animated transform scale
            transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0, 1.0, 1.0),
            transformAlignment: Alignment.centerLeft,
            child: Row(
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    color: itemColor,
                    fontWeight: fontWeight,
                  ),
                  child: Icon(
                    widget.icon,
                    color: itemColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    color: itemColor,
                    fontWeight: fontWeight,
                  ),
                  child: Text(widget.label),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
