// experience_section.dart
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';

/// Data model for a project
class _Project {
  final String icon;
  final String title;
  final String description;
  final String details;
  final bool isUnderDevelopment;
  final List<String> images;
  final String? playUrl;
  final String? storeUrl;

  const _Project({
    required this.icon,
    required this.title,
    required this.description,
    required this.details,
    required this.images,
    this.isUnderDevelopment = false,
    this.playUrl,
    this.storeUrl,
  });
}

/// List of projects to display
const List<_Project> _projects = [
  _Project(
    icon: 'assets/onsite.webp',
    title: 'GFSys OnSite',
    description: 'Mobile invoice & production order management',
    details: 'On-the-go creation, editing, and management of invoices and production orders, improving upon the web ERP experience.',
    images: [
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797413/onsite_0_mc2kvn.jpg',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797413/onsite_1_hrj0pc.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797413/onsite_2_wrgala.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797414/onsite_3_s94ido.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797424/onsite_92_uei1ps.jpg',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797424/onsite_91_drjg3k.jpg',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797417/onsite_9_sf6b4u.jpg',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797416/onsite_8_embrec.jpg',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797416/onsite_6_zngpnu.jpg',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797415/onsite_5_grzybr.jpg',
    ],
    playUrl: "https://play.google.com/store/apps/details?id=com.gfsys.app",
    storeUrl: "https://apps.apple.com/do/app/gfsys-onsite/id6446652847",
  ),
  _Project(
    icon: 'assets/global_reports.webp',
    title: 'Global Reports',
    description: 'Connects to Aloha for reports & order management',
    details: 'Provides quick access to reports and order management, simplifying operational workflows.',
    images: [
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108147/gr_5_lbhvm5.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108147/gr_6_swhbdm.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108148/gr_12_uvyid2.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108148/gr_11_ed2vbr.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108151/gr_13_iqeemi.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108147/gr_7_vtv708.png',
    ],
    playUrl: "https://play.google.com/store/apps/details?id=com.pcnub.global_reports_mobile",
    storeUrl: "https://apps.apple.com/ec/app/global-reports-app/id6475050595",
  ),
  _Project(
    icon: "assets/caba_now.webp",
    title: "GF Caba Now",
    description: "Dedicated admin application for monitoring sales analytics and performance metrics",
    details:
        "Streamlined administrative workflow with intuitive user and subscription management. Future roadmap includes AI-powered insights and predictive analytics features",
    isUnderDevelopment: false,
    images: [
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797410/caba_1_ipjaww.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797410/caba_2_mvdzyi.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797410/caba_3_du5lrq.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797410/caba_4_yrccx3.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797411/caba_5_b9w08o.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797411/caba_6_hps30u.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797412/caba_7_arfqhc.png',
    ],
    playUrl: "https://play.google.com/store/apps/details?id=com.gfsysapp.cabanow",
    storeUrl: "https://apps.apple.com/ec/app/gf-caba-now/id6447591623",
  ),
  _Project(
    icon: "assets/gf_user.png",
    title: "GF User Manager",
    description: "Manage users, their permissions, and more.",
    details: "With this app,I'm aiming to make it easier for admins to manage users and their plans",
    isUnderDevelopment: true,
    images: [
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797409/admin_1_yuojma.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797409/admin_2_ist07j.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797409/admin_3_ltlzwc.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797409/admin_4_zyxot5.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1747797410/admin_5_t53ppg.png',
    ],
  ),
  _Project(
    icon: "assets/access_pro_logo_dark.png",
    title: "Access Pro",
    description: "App for accessing small-medium business like gyms, salons, etc.",
    details: "With this app,I'm aiming to make it easier for admins to manage users and their plans",
    isUnderDevelopment: true,
    images: [
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108326/ap_1_twiarv.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108327/ap_2_hsw3fd.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108327/ap_3_rterzk.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108327/ap_4_qqtrbd.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108327/ap_5_h7wo9j.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108327/ap_6_wddxsv.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108328/ap_7_r73huj.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108329/ap_8_miprfs.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108332/ap_11_vrnglq.png',
      'https://res.cloudinary.com/dgvc1q9jw/image/upload/v1748108331/ap_9_ble2w7.png',
    ],
  ),
  // Add other projects similarly...
];

/// Responsive Experience Section
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Card(
          elevation: 0,
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience',
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Projects I\'ve Worked On',
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final isNarrow = width < 600;

                    if (isNarrow) {
                      // Single column layout for narrow screens
                      return Column(
                        children: _projects
                            .map((project) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: _ExperienceCard(
                                    project: project,
                                    theme: theme,
                                    isNarrowLayout: true,
                                  ),
                                ))
                            .toList(),
                      );
                    } else {
                      // Grid layout for wider screens
                      int columns = width < 1000 ? 2 : 3;
                      double aspectRatio = width < 1000 ? 1.1 : 0.9;

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: aspectRatio,
                        ),
                        itemCount: _projects.length,
                        itemBuilder: (context, index) {
                          final project = _projects[index];
                          return _ExperienceCard(
                            project: project,
                            theme: theme,
                            isNarrowLayout: false,
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Card widget for each project
class _ExperienceCard extends StatelessWidget {
  final _Project project;
  final ThemeData theme;
  final bool isNarrowLayout;

  const _ExperienceCard({
    required this.project,
    required this.theme,
    required this.isNarrowLayout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: isNarrowLayout ? _buildNarrowLayout() : _buildWideLayout(),
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Row(
          children: [
            ClipOval(
              child: Image.asset(project.icon, width: 32, height: 32),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                project.title,
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Description
        Text(
          project.description,
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        if (project.details.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            project.details,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ],
        const SizedBox(height: 12),

        // Images in a grid for narrow layout
        if (project.images.isNotEmpty) ...[
          _buildImageGrid(),
          const SizedBox(height: 12),
        ],

        // Store buttons
        _buildStoreButtons(isVertical: true),
      ],
    );
  }

  Widget _buildWideLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with store buttons
        Row(
          children: [
            ClipOval(
              child: Image.asset(project.icon, width: 32, height: 32),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                project.title,
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
            _buildStoreButtons(isVertical: false),
          ],
        ),
        const SizedBox(height: 8),

        // Description
        Text(
          project.description,
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        if (project.details.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            project.details,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        const SizedBox(height: 8),

        // Horizontal image list
        Expanded(
          child: _buildHorizontalImageList(),
        ),
      ],
    );
  }

  Widget _buildImageGrid() {
    // Show images in a 2-column grid for narrow layout
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: project.images.length > 4 ? 4 : project.images.length,
      itemBuilder: (context, idx) => _buildImageThumbnail(context, idx),
    );
  }

  Widget _buildHorizontalImageList() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: project.images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, idx) => _buildImageThumbnail(context, idx),
      ),
    );
  }

  Widget _buildImageThumbnail(BuildContext context, int idx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: _LazyLoadedImage(
        thumbnailUrl: _getOptimizedImageUrl(project.images[idx]), // Optimized thumbnail
        tag: 'project_image_${project.title}_$idx',
        onTap: () {
          // Action to open the FullScreenImageViewer
          showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.9), // Ensure barrier is dark
            builder: (_) => FullScreenImageViewer(
              imageUrls: project.images, // Pass the full list of original image URLs
              initialIndex: idx, // Pass the index of the image that was tapped
            ),
          );
        },
      ),
    );
  }

  String _getOptimizedImageUrl(String originalUrl) => originalUrl.replaceFirst('/upload/', '/upload/h_200,c_scale/');

  Widget _buildStoreButtons({required bool isVertical}) {
    if (project.isUnderDevelopment) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Under Development',
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
        ),
      );
    }

    final buttons = <Widget>[];

    if (project.playUrl != null) {
      buttons.add(_StoreButton(
        icon: Logos.google_play_icon,
        label: 'Play',
        url: project.playUrl!,
        isCompact: !isVertical,
      ));
    }

    if (project.storeUrl != null) {
      buttons.add(_StoreButton(
        icon: Logos.apple_app_store,
        label: 'App Store',
        url: project.storeUrl!,
        isCompact: !isVertical,
      ));
    }

    if (buttons.isEmpty) return const SizedBox.shrink();

    if (isVertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons
            .map((button) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: button,
                ))
            .toList(),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: buttons
            .map((button) => Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: button,
                ))
            .toList(),
      );
    }
  }

  void _showFullScreenImage(int index) {
    // This would need to be implemented with proper context
    // You might want to use a callback or state management solution
  }
}

/// Button for app store links
class _StoreButton extends StatelessWidget {
  final String icon;
  final String label;
  final String url;
  final bool isCompact;

  const _StoreButton({
    required this.icon,
    required this.label,
    required this.url,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return TextButton.icon(
        onPressed: () => html.window.open(url, '_blank'),
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[850],
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
          minimumSize: Size.zero,
        ),
        icon: Iconify(icon, size: 14),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      );
    } else {
      return TextButton.icon(
        onPressed: () => html.window.open(url, '_blank'),
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[850],
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        ),
        icon: Iconify(icon, size: 16),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      );
    }
  }
}

// Widget para carga diferida con placeholder borroso y cache
class _LazyLoadedImage extends StatelessWidget {
  // Changed to StatelessWidget for simplicity
  final String thumbnailUrl;
  // final String fullImageUrl; // No longer strictly needed by this widget if tap opens viewer
  final String tag; // Kept for potential non-Hero use, or if Hero is re-added
  final VoidCallback? onTap; // Callback for when the image is tapped

  const _LazyLoadedImage({
    Key? key,
    required this.thumbnailUrl,
    // required this.fullImageUrl,
    required this.tag,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the passed onTap callback
      child: ClipRRect(
        // Removed the Stack and _isLoading logic as it only shows thumbnail now
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: thumbnailUrl, // Always show the optimized thumbnail
          width: 100, // Fixed width for the thumbnail
          height: 100, // Fixed height for the thumbnail
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            width: 100,
            height: 100,
            color: Colors.grey[800],
            child: const Center(child: Icon(Icons.image, color: Colors.grey)),
          ),
          errorWidget: (context, url, error) => Container(
            width: 100,
            height: 100,
            color: Colors.grey[800],
            child: const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
          ),
        ),
      ),
    );
  }
}

// Visor de imágenes a pantalla completa
class FullScreenImageViewer extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;
  // final String baseHeroTag; // Example if Hero were to be used systematically

  const FullScreenImageViewer({
    // super.key, // The 'super.key' was passed here before
    Key? key,
    required this.imageUrls,
    required this.initialIndex,
    // required this.baseHeroTag, // Example
  }) : super(key: key);

  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextImage() {
    if (_currentIndex < widget.imageUrls.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousImage() {
    if (_currentIndex > 0) {
      _pageController.animateToPage(
        _currentIndex - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black.withOpacity(0.9), // use withOpacity for clarity
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            // Outer gesture detector to pop on tap (optional, can be confusing with PageView)
            // onTap: () => Navigator.of(context).pop(), // Consider if this is desired behavior
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                // final String heroTagForThisImage = '${widget.baseHeroTag}_$index'; // Example if Hero was used
                // Removed Hero widget
                return InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: Center(
                    child: CachedNetworkImage(
                      // Using CachedNetworkImage for consistency and features
                      imageUrl: widget.imageUrls[index],
                      fit: BoxFit.contain,
                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 48),
                            const SizedBox(height: 16),
                            Text(
                              'Error loading image', // Corrected typo
                              style: TextStyle(color: Colors.white.withOpacity(0.7)),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '${_currentIndex + 1} / ${widget.imageUrls.length}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          if (_currentIndex > 0)
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 36),
                  onPressed: _previousImage,
                ),
              ),
            ),
          if (_currentIndex < widget.imageUrls.length - 1)
            Positioned(
              right: 16,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 36),
                  onPressed: _nextImage,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
