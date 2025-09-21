import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const PetWorkApp());
}

class PetWorkApp extends StatelessWidget {
  const PetWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetWork',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A90E2)),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildLocationCard(),
              const SizedBox(height: 20),
              _buildWalkingIndexCard(),
              const SizedBox(height: 20),
              _buildWeatherDetailsSection(),
              const SizedBox(height: 20),
              _buildPetCareTipsCard(),
              const SizedBox(height: 20),
              _buildHourlyWalkingIndexSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFF4A90E2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                FontAwesomeIcons.paw,
                color: Colors.white,
                size: 16,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              '산책지수',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.notifications_outlined,
              color: Colors.grey[600],
              size: 24,
            ),
            const SizedBox(width: 16),
            Icon(Icons.person_outline, color: Colors.grey[600], size: 24),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: const Color(0xFF4A90E2), size: 20),
          const SizedBox(width: 8),
          const Text(
            '서울시 강남구',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2C3E50),
            ),
          ),
          const Spacer(),
          Text(
            '현재 위치 기준',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          const SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 20),
        ],
      ),
    );
  }

  Widget _buildWalkingIndexCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF4A90E2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              FontAwesomeIcons.dog,
              color: Color(0xFF4A90E2),
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '산책하기 좋음',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF357ABD),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const Text(
                  '85',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '산책지수',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '반려동물과 산책하기 좋은 날씨입니다',
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '날씨 상세정보',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: [
            _buildWeatherCard(
              '온도',
              '22°C',
              Icons.wb_sunny,
              const Color(0xFFFFD700),
            ),
            _buildWeatherCard(
              '습도',
              '65%',
              Icons.water_drop,
              const Color(0xFF87CEEB),
            ),
            _buildWeatherCard('바람', '약함', Icons.air, const Color(0xFF90EE90)),
            _buildWeatherCard(
              '자외선',
              '보통',
              Icons.visibility,
              const Color(0xFFDDA0DD),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetCareTipsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF90EE90),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.heart,
                color: Color(0xFF228B22),
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                '오늘의 반려동물 케어 팁',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildCareTip('충분한 수분 공급을 해주세요'),
          const SizedBox(height: 8),
          _buildCareTip('발가락 사이 청결을 확인해주세요'),
        ],
      ),
    );
  }

  Widget _buildCareTip(String tip) {
    return Row(
      children: [
        const Icon(FontAwesomeIcons.check, color: Color(0xFF228B22), size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            tip,
            style: const TextStyle(fontSize: 14, color: Color(0xFF2C3E50)),
          ),
        ),
      ],
    );
  }

  Widget _buildHourlyWalkingIndexSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '시간별 산책지수',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildHourlyCard(
              '14시',
              '75',
              FontAwesomeIcons.cat,
              const Color(0xFFFF8C00),
            ),
            _buildHourlyCard(
              '15시',
              '85',
              FontAwesomeIcons.dog,
              const Color(0xFF4A90E2),
            ),
            _buildHourlyCard(
              '16시',
              '90',
              FontAwesomeIcons.paw,
              const Color(0xFF90EE90),
            ),
            _buildHourlyCard(
              '17시',
              '80',
              FontAwesomeIcons.dog,
              const Color(0xFFFFD700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHourlyCard(
    String time,
    String index,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: color, width: 2),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          index,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF4A90E2),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: '산책로'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: '기록'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '내정보'),
      ],
    );
  }
}
