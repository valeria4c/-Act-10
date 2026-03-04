import 'package:flutter/material.dart';

// Paleta de colores que combina los diseños
class AppColors {
  static const Color primary = Color(0xFF2C3E50); // Azul oscuro para la barra de navegación
  static const Color accentOrange = Color(0xFFE67E22); // Naranja para botones de acción
  static const Color accentBlue = Color(0xFF5D7D9A); // Azul grisáceo para otros botones
  static const Color background = Color(0xFFF8F9FA); // Fondo muy claro
  static const Color textDark = Color(0xFF34495E); // Texto principal oscuro
  static const Color textLight = Colors.white;
  static const Color cardBackground = Colors.white;
  static const Color nextSessionCard = Color(0xFF424242); // Gris oscuro para la tarjeta de sesión
  static const Color selectedIcon = Color(0xFFF1C40F); // Ámbar para el ícono seleccionado
  static const Color iconColor = Color(0xFF2C3E50);
}

void main() {
  runApp(const StudioMochiApp());
}

class StudioMochiApp extends StatelessWidget {
  const StudioMochiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'sans-serif',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: AppColors.iconColor),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.primary,
          selectedItemColor: AppColors.selectedIcon,
          unselectedItemColor: AppColors.textLight, // Actualizado a blanco
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 8),
            Text("STUDIO MOCHI 22PX"), // Actualizado el título
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bienvenido",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: AppColors.textDark),
            ),
            const SizedBox(height: 20),
            _buildNextSessionCard(context),
            const SizedBox(height: 30),
            const Text(
              "Nuestros servicios",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark),
            ),
            const SizedBox(height: 15),
            _buildServicesGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Inicio seleccionado
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'INICIO'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'SESIONES'),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library), label: 'GALERIA'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PERFIL'),
        ],
        onTap: (index) {
          // Lógica de navegación
        },
      ),
    );
  }

  Widget _buildNextSessionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.nextSessionCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Próxima sesión:",
            style: TextStyle(color: AppColors.textLight, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "NO HAY NINGUNA",
            style: TextStyle(
                color: AppColors.textLight,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "AGENDAR",
              style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildServicesGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.6, 
      children: [
        _buildServiceCard("Eventos y Personas"),
        _buildServiceCard("Corporativo y Profesional"),
        _buildServiceCard("Producto y Comercial"),
        _buildServiceCard("Foto + Video"),
        _buildServiceCard("Edición e Impresión"),
        _buildServiceCard("Otros servicios"),
      ],
    );
  }

  Widget _buildServiceCard(String title) {
    return Card(
      elevation: 2,
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textDark),
        ),
      ),
    );
  }
}
