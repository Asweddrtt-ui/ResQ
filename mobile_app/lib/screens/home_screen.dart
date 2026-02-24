import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // To track Bottom Navigation Bar
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Matches your background
      appBar: AppBar(

        centerTitle: false,

        leading: Image.asset("assets/images/logo.PNG",

            fit: BoxFit.cover),

        title: Text("ResQ",

            style: GoogleFonts.nunito(

              fontWeight: FontWeight.bold,

              fontSize: 22,

            )),

        actions: [

          Container(

            decoration: BoxDecoration(

              color: Color(0xffffa94d),

              borderRadius: BorderRadius.circular(10),

            ),

            child: IconButton(onPressed: (){},

                icon: Icon(Icons.notifications_none_outlined)),

          ),

          SizedBox(width: 10),

          Container(

            decoration: BoxDecoration(

              color: Color(0xffffa94d),

              borderRadius: BorderRadius.circular(10),

            ),

            child: IconButton(onPressed: (){},

                icon: Icon(Icons.account_circle_outlined)),

          )

        ],

      ),
      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffffa94d),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.nunito(fontSize: 10),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: "Report"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Adoption"),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Lost"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),

      // --- MAIN BODY ---
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // 1. Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search cases, shelters, vets",
                        hintStyle: GoogleFonts.nunito(color: Colors.grey, fontSize: 14),
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 2. Nearby Cases Map Card
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nearby Cases", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16)),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xffffa94d),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.map_outlined, size: 14, color: Colors.black),
                                  const SizedBox(width: 4),
                                  Text("Open full map", style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Map Placeholder
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(child: Icon(Icons.map, color: Colors.grey, size: 40)),
                        ),
                        const SizedBox(height: 15),

                        // Legend Pills
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildLegendPill("Urgent", const Color(0xffffa94d), Colors.red),
                            _buildLegendPill("Moderate", const Color(0xffffa94d), Colors.yellow),
                            _buildLegendPill("Resolved", const Color(0xffffa94d), Colors.green),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 3. Action Grid
                  Row(
                    children: [
                      Expanded(child: _buildActionCard(Icons.add_circle_outline, "Report a\nCase")),
                      const SizedBox(width: 15),
                      Expanded(child: _buildActionCard(Icons.article_outlined, "View Feed")),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: _buildActionCard(Icons.grid_view, "Donate")),
                      const SizedBox(width: 15),
                      Expanded(child: _buildActionCard(Icons.search, "Lost & Found")),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // 4. Latest Updates Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Latest Updates", style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("See all", style: GoogleFonts.nunito(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // 5. Update Cards
                  _buildUpdateCard(
                    title: "Injured dog near 5th Ave",
                    tag: "Emergency",
                    tagColor: const Color(0xfff46363),
                    distanceInfo: "2.1 km • Reported 10m ago",
                  ),
                  const SizedBox(height: 15),
                  _buildUpdateCard(
                    title: "Cat stuck on a tree",
                    tag: "Moderate",
                    tagColor: const Color(0xffffc107),
                    distanceInfo: "4.3 km • Updated 1h ago",
                  ),

                  const SizedBox(height: 30), // Bottom Padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildLegendPill(String text, Color color, Color circle_color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(width: 8, height: 8, decoration: BoxDecoration(color: circle_color, shape: BoxShape.circle)),
          const SizedBox(width: 5),
          Text(text, style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffffa94d),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.black, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.bold, height: 1.2)),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateCard({
    required String title,
    required String tag,
    required Color tagColor,
    required String distanceInfo,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Placeholder
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.pets, color: Colors.grey),
          ),
          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(title,
                        style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 2, overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: tagColor, borderRadius: BorderRadius.circular(10)),
                      child: Text(tag, style: GoogleFonts.nunito(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(distanceInfo, style: GoogleFonts.nunito(fontSize: 10, color: Colors.grey)),
                const SizedBox(height: 10),

                // Buttons
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: const Color(0xffffa94d), borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          const Icon(Icons.share, size: 12),
                          const SizedBox(width: 4),
                          Text("Share", style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: const Color(0xff5bb381), borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline, size: 12, color: Colors.white),
                          const SizedBox(width: 4),
                          Text("Details", style: GoogleFonts.nunito(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}