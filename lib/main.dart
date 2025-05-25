import 'package:flutter/material.dart';
import 'package:flutter_portfolio/providers/portfolio_provider.dart';
import 'package:flutter_portfolio/screens/about.dart';
import 'package:flutter_portfolio/screens/contact.dart';
import 'package:flutter_portfolio/screens/experience.dart';
import 'package:flutter_portfolio/screens/home.dart';
import 'package:flutter_portfolio/screens/skills.dart';
import 'package:flutter_portfolio/widgets/sidebar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PortfolioProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anthony Chamba Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.inter().fontFamily,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Consumer<PortfolioProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: isMobile ? const Drawer(child: SidebarNavigation()) : null,
          appBar: isMobile
              ? AppBar(
                  title: Text('Portfolio', style: TextStyle(color: Colors.white)),
                  backgroundColor: primaryColor,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: secondaryColor),
                  ),
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(LucideIcons.menu, color: Colors.white),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                )
              : null,
          body: Row(
            children: [
              if (!isMobile) const SidebarNavigation(),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/bg.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) => Container(
                          color: Colors.black87,
                          child: const Center(
                            child: Text(
                              'Background image not found',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _buildScrollableContent(provider),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScrollableContent(PortfolioProvider provider) {
    return ScrollablePositionedList.builder(
      itemScrollController: provider.itemScrollController,
      itemPositionsListener: provider.itemPositionsListener,
      itemCount: provider.sectionOrder.length,
      physics: const ClampingScrollPhysics(),
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      itemBuilder: (context, index) {
        final name = provider.sectionOrder[index];
        return Container(
          key: ValueKey(name),
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: _buildSectionWidget(name),
        );
      },
    );
  }

  Widget _buildSectionWidget(String name) {
    switch (name) {
      case 'home':
        return const HomeSection();
      case 'experience':
        return const ExperienceSection();
      case 'skills':
        return const SkillsSection();
      case 'about':
        return const AboutMeSection();
      case 'contact':
        return const ContactSection();
      default:
        return _buildErrorSection(name);
    }
  }

  Widget _buildErrorSection(String name, {String? error}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red.shade400),
            const SizedBox(height: 16),
            Text('Error loading $name', style: const TextStyle(color: Colors.white, fontSize: 18)),
            if (error != null) ...[
              const SizedBox(height: 8),
              Text(error, style: TextStyle(color: Colors.grey.shade400), textAlign: TextAlign.center),
            ],
          ],
        ),
      ),
    );
  }
}
