import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PortfolioProvider extends ChangeNotifier {
  // Controller para ScrollablePositionedList
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  // Orden de las secciones
  final List<String> sectionOrder = [
    'home',
    'experience',
    'skills',
    'about',
    // 'resume',
    'contact',
  ];

  // Sección activa actual
  String _activeSection = 'home';
  String get activeSection => _activeSection;

  // Flag para evitar loops de navegación
  bool _isNavigating = false;
  bool get isNavigating => _isNavigating;

  PortfolioProvider() {
    // Escuchar cambios en las posiciones visibles
    itemPositionsListener.itemPositions.addListener(_onItemPositionsChanged);
  }

  void _onItemPositionsChanged() {
    if (_isNavigating) return; // Evitar updates durante navegación manual

    final positions = itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) return;

    // Encontrar la sección que está más visible (mayor área visible)
    ItemPosition? mostVisibleItem;
    double maxVisibleArea = 0;

    for (final position in positions) {
      // Calcular el área visible del item
      final visibleArea = _calculateVisibleArea(position);

      if (visibleArea > maxVisibleArea) {
        maxVisibleArea = visibleArea;
        mostVisibleItem = position;
      }
    }

    if (mostVisibleItem != null && mostVisibleItem.index < sectionOrder.length) {
      final newSection = sectionOrder[mostVisibleItem.index];

      if (newSection != _activeSection) {
        _activeSection = newSection;
        notifyListeners();
      }
    }
  }

  // Calcular el área visible de un item
  double _calculateVisibleArea(ItemPosition position) {
    if (position.itemLeadingEdge >= 1.0 || position.itemTrailingEdge <= 0.0) {
      return 0.0; // Item completamente fuera de vista
    }

    final leadingEdge = position.itemLeadingEdge < 0 ? 0.0 : position.itemLeadingEdge;
    final trailingEdge = position.itemTrailingEdge > 1.0 ? 1.0 : position.itemTrailingEdge;

    return trailingEdge - leadingEdge;
  }

  // Método para navegar a una sección
  Future<void> setActiveSection(String section) async {
    final index = sectionOrder.indexOf(section);
    if (index == -1) return;

    _isNavigating = true;
    _activeSection = section;
    notifyListeners();

    await itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
      alignment: 0.0,
    );

    _activeSection = section;
    _isNavigating = false;
    notifyListeners();
  }

  // Navegar a una sección por su índice
  Future<void> scrollToIndex(int index) async {
    if (index < 0 || index >= sectionOrder.length) return;
    final section = sectionOrder[index];
    await setActiveSection(section);
  }

  // Navegar a la siguiente sección
  void nextSection() {
    final currentIndex = sectionOrder.indexOf(_activeSection);
    if (currentIndex < sectionOrder.length - 1) {
      setActiveSection(sectionOrder[currentIndex + 1]);
    }
  }

  // Navegar a la sección anterior
  void previousSection() {
    final currentIndex = sectionOrder.indexOf(_activeSection);
    if (currentIndex > 0) {
      setActiveSection(sectionOrder[currentIndex - 1]);
    }
  }

  @override
  void dispose() {
    // Los controllers de scrollable_positioned_list se limpian automáticamente
    super.dispose();
  }
}
