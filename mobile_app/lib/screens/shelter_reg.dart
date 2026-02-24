import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ShelterRegistrationScreen extends StatefulWidget {
  const ShelterRegistrationScreen({super.key});

  @override
  State<ShelterRegistrationScreen> createState() => _ShelterRegistrationScreenState();
}

class _ShelterRegistrationScreenState extends State<ShelterRegistrationScreen> {
  // Controllers for your backend teammate to use later
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String? _selectedFileName;
  Future<void> _pickDocument() async {
    // Opens the native file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'], // Limit to documents/images
    );

    if (result != null) {
      // If they picked a file, update the UI with the file name
      setState(() {
        _selectedFileName = result.files.single.name;
      });
    } else {
      // User canceled the picker
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Prevents Dark Mode black background issue
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background Pattern/Color
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey.withOpacity(0.1),
              ),

              // Main Scrollable Card
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Container(
                  width: 325.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Green Badge
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: const Color(0xff5bb381),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          "Shelter verification",
                          style: GoogleFonts.nunito(
                            color: Colors.black87,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      // 2. Header
                      Text(
                        "Tell us about your shelter",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "We'll review your details to keep adoptions safe and transparent.",
                        style: GoogleFonts.nunito(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 25.h),

                      // --- FORM FIELDS ---

                      _buildLabel("Shelter name"),
                      _buildTextField(hint: "Hope Paws Shelter", controller: _nameController),
                      SizedBox(height: 15.h),

                      _buildLabel("Phone number"),
                      _buildTextField(hint: "+1 555 123 4567", controller: _phoneController, isNumber: true),
                      SizedBox(height: 15.h),

                      _buildLabel("City / Area"),
                      _buildTextField(hint: "Riverdale, East District", controller: _cityController),
                      SizedBox(height: 15.h),

                      _buildLabel("Shelter description"),
                      _buildTextField(
                        hint: "Short description of your mission and facilities.",
                        controller: _descController,
                        maxLines: 3, // Taller box for description
                      ),
                      SizedBox(height: 15.h),

                      // Document Upload
                      _buildLabel("Upload license / NGO document"),
                      SizedBox(height: 5.h),
                      GestureDetector(
                        onTap: () {
                          _pickDocument();
                        },
                        child: Text(
                          _selectedFileName ?? "Tap to upload file or photo",                          style: GoogleFonts.nunito(
                            fontSize: 14.sp,
                            color: Colors.blueGrey.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),

                      // Info Banner
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                          color: const Color(0xff5bb381), // Green
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Text(
                          "Your account will be activated after our team reviews your documents.",
                          style: GoogleFonts.nunito(
                            color: Colors.black87,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Submit Button
                      Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffffa94d), // Orange
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // TODO: Submit logic
                          },
                          child: Text(
                            "Submit for review",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
    bool isNumber = false,
  }) {
    // In the design, these fields look like they don't have a border,
    // or maybe a very faint one. I'll make it clean with no visible background.
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
        style: GoogleFonts.nunito(fontSize: 14.sp),
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }
}