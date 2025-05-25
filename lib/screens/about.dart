import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
                const SizedBox(height: 32),

                // Personal Bio Section
                _buildBioSection(theme, context),
                const SizedBox(height: 40),

                // Education Timeline
                _buildSectionTitle(theme, "Education Journey"),
                const SizedBox(height: 24),
                _buildEducationTimeline(theme),
                const SizedBox(height: 40),

                // Personal Interests Section
                _buildSectionTitle(theme, "Personal Interests"),
                const SizedBox(height: 24),
                _buildInterestsSection(theme),
                const SizedBox(height: 40),

                // Goals and Aspirations
                _buildGoalsSection(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) => Text(
        "About Me",
        style: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  Widget _buildSubheader(ThemeData theme) => Text(
        "Get to know who I am",
        style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
      );

  Widget _buildSectionTitle(ThemeData theme, String title) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        child: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget _buildBioSection(ThemeData theme, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900.withOpacity(0.4),
            Colors.black87,
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (MediaQuery.of(context).size.width > 600)
            Column(
              children: [
                _buildProfileImage(theme),
                const SizedBox(height: 24),
                _buildMapLocation(theme),
              ],
            ),
          SizedBox(width: MediaQuery.of(context).size.width > 600 ? 24 : 0),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (MediaQuery.of(context).size.width <= 600) Center(child: _buildProfileImage(theme, size: 150)),
                if (MediaQuery.of(context).size.width <= 600) const SizedBox(height: 24),
                Text(
                  "Anthony Chamba",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(LucideIcons.mapPin, color: Colors.red.shade400, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      "Quito, Ecuador",
                      style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey.shade300),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "I'm a passionate Software Engineer from Quito, Ecuador, specializing in mobile application development with Flutter. With a solid background in engineering from Escuela Politécnica Nacional, I've spent the last 4 years crafting efficient and scalable mobile solutions.",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade300,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "My journey in technology began with a fascination for solving real-world problems through software. Today, I combine technical expertise with business understanding to deliver applications that not only work flawlessly but also provide exceptional user experiences.",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade300,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _buildInfoChip(theme, LucideIcons.languages, "Spanish (Native), English (Advanced)"),
                    _buildInfoChip(theme, LucideIcons.graduationCap, "Software Engineering"),
                    _buildInfoChip(theme, LucideIcons.code, "4+ Years Experience"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapLocation(ThemeData theme) {
    return Container(
      height: 200,
      width: 280,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AbsorbPointer(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(-0.1807, -78.4678), // Quito
              initialZoom: 8.0,
            ),
            mapController: MapController(),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(-0.1807, -78.4678),
                    width: 40,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blueAccent, width: 2),
                        color: Colors.blueAccent.withValues(alpha: 0.2),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(ThemeData theme, {double size = 280}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue.shade400.withValues(alpha: 0.2), width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade700.withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage("assets/profile.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildInfoChip(ThemeData theme, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue.shade400, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              maxLines: 2,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationTimeline(ThemeData theme) {
    final List<Map<String, dynamic>> educationItems = [
      {
        'period': '2016 - 2021',
        'degree': 'Bachelor in Software Engineering',
        'institution': 'Escuela Politécnica Nacional',
        'location': 'Quito, Ecuador',
        'description': 'Specialized in software development methodologies, database management, and mobile application development.',
        'color': Colors.blue.shade400,
        'icon': LucideIcons.graduationCap,
      },
      {
        'period': '2022',
        'degree': 'UX for Mobile Devices Certification',
        'institution': 'Platzi',
        'location': 'Online',
        'description': 'Advanced course on designing intuitive user experiences specifically for mobile applications.',
        'color': Colors.green.shade400,
        'icon': LucideIcons.smartphone,
      },
      {
        'period': '2023',
        'degree': 'SCRUM Certification',
        'institution': 'Platzi',
        'location': 'Online',
        'description': 'Professional certification in agile development methodologies and SCRUM framework.',
        'color': Colors.purple.shade400,
        'icon': LucideIcons.kanban,
      },
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: educationItems.length,
        itemBuilder: (context, index) {
          final item = educationItems[index];
          final bool isLast = index == educationItems.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: item['color'].withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(color: item['color'], width: 2),
                    ),
                    child: Icon(item['icon'], color: item['color'], size: 20),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 80,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: item['color'].withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item['period'],
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: item['color'],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['degree'],
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        Text(
                          item['institution'],
                          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade300),
                        ),
                        const SizedBox(width: 8),
                        Icon(LucideIcons.mapPin, color: Colors.red.shade400, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          item['location'],
                          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['description'],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade400,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInterestsSection(ThemeData theme) {
    final List<Map<String, dynamic>> interests = [
      {
        'icon': LucideIcons.code,
        'title': 'Programming',
        'description': 'Exploring new technologies and frameworks, particularly in mobile development.',
        'color': Colors.blue.shade400,
      },
      {
        'icon': LucideIcons.mountain,
        'title': 'Hiking',
        'description': 'Exploring the beautiful landscapes of Ecuador, especially the Andes mountains.',
        'color': Colors.green.shade600,
      },
      {
        'icon': LucideIcons.bookOpen,
        'title': 'Reading',
        'description': 'Science fiction and technical books about software development and AI.',
        'color': Colors.amber.shade600,
      },
      {
        'icon': LucideIcons.music,
        'title': 'Music',
        'description': 'Playing guitar and listening to rock and Latin American music.',
        'color': Colors.purple.shade400,
      },
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: interests.map((interest) => _buildInterestCard(theme, interest)).toList(),
    );
  }

  Widget _buildInterestCard(ThemeData theme, Map<String, dynamic> interest) {
    return Container(
      width: 210,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: interest['color'].withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: interest['color'].withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              interest['icon'],
              color: interest['color'],
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            interest['title'],
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            interest['description'],
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade400,
              height: 1.5,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildGoalsSection(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.purple.shade900.withOpacity(0.4),
            Colors.black87,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade900.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  LucideIcons.target,
                  color: Colors.purple.shade300,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "My Goals & Aspirations",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "As I continue to grow in my career, I'm focused on creating innovative mobile solutions that make a real difference in people's lives. I aspire to become a leading expert in cross-platform development and contribute to open-source projects that advance the Flutter ecosystem.",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade300,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildGoalItem(
                  theme,
                  LucideIcons.rocket,
                  "Professional",
                  [
                    "Master advanced state management techniques in Flutter",
                    "Lead larger development teams on enterprise projects",
                    "Contribute to open-source Flutter packages",
                  ],
                  Colors.blue.shade400,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _buildGoalItem(
                  theme,
                  LucideIcons.heartHandshake,
                  "Personal",
                  [
                    "Mentor aspiring developers in Latin America",
                    "Speak at international Flutter conferences",
                    "Create educational content about mobile development",
                  ],
                  Colors.pink.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoalItem(
    ThemeData theme,
    IconData icon,
    String title,
    List<String> goals,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...goals.map((goal) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(LucideIcons.check, color: color.withOpacity(0.8), size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      goal,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
